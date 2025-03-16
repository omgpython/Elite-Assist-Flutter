import 'dart:convert';
import 'dart:developer';

import 'package:elite_assist/common_ui/custom_snackbar.dart';
import 'package:elite_assist/generated/const_data.dart';
import 'package:elite_assist/generated/pref_manager.dart';
import 'package:elite_assist/model/apply_coupon_model.dart';
import 'package:elite_assist/model/order_model.dart';
import 'package:elite_assist/view/success_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  PrefManager manager = PrefManager();
  final couponController = TextEditingController();
  final focusNode = FocusNode();

  RxInt amount = 0.obs,
      gst = 0.obs,
      total_amount = 0.obs,
      fees = 0.obs,
      discount = 0.obs;
  RxString date = "Select Date".obs;
  RxString time = "Select Time".obs;
  String pay_type = "COD", couponCode = "No Coupon Apply";
  bool isCouponApply = false;

  @override
  void onInit() {
    super.onInit();
  }

  void calculateAmount() {
    if (amount.value > 499) {
      fees.value = 99;
    } else if (amount.value > 999) {
      fees.value = 199;
    } else {
      fees.value = 49;
    }
    gst.value = ((amount.value + fees.value) * .05).round();
    total_amount.value =
        (amount.value - discount.value) + gst.value + fees.value;

    if (total_amount.value <= 0) {
      total_amount.value = 0;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now().add(Duration(days: 1));
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(Duration(days: 1));
    final DateTime maxDate = tomorrow.add(Duration(days: 6));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: tomorrow,
      lastDate: maxDate,
    );

    if (picked != null && picked != selectedDate) {
      date.value = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay initialTime = TimeOfDay(
      hour: 10,
      minute: 0,
    );
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      if (pickedTime.hour >= 10 && pickedTime.hour <= 20) {
        final formattedTime = DateFormat('h:mm a').format(
          DateTime(2022, 1, 1, pickedTime.hour, pickedTime.minute),
        );
        time.value = formattedTime;
      } else {
        CustomSnackBar(
          title: "Invalid Time",
          message: "Please select a time between 10 AM and 8 PM",
        );
      }
    }
  }

  ApplyCouponModel? couponModel;

  Future<void> applyCoupon() async {
    try {
      final url = Uri.parse(ConstantData.APPLY_COUPON_API);
      var response = await http.post(
        url,
        body: {'ccode': couponController.text.trim()},
      );

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)["status"].toString() == "true") {
          couponModel = applyCouponModelFromJson(response.body);
          discount.value = int.parse(couponModel!.coupen.coupenDiscount);
          couponCode = couponModel!.coupen.coupenCode;
          isCouponApply = true;
          calculateAmount();
          CustomSnackBar(
            title: "Coupon Applied",
            message: "Your discount has been applied to your order.",
          );
        } else {
          couponController.clear();
          discount.value = 0;
          couponCode = "No Coupon Apply";
          isCouponApply = false;
          calculateAmount();
          CustomSnackBar(
            title: "Invalid Coupon Code",
            message: "Please check the code and try again.",
          );
          //log("COUPON", name: response.body);
        }
      }
    } catch (e) {
      log("SERVER ERROR", name: e.toString());
    }
  }

  void clearCoupon() {
    if (isCouponApply) {
      couponController.clear();
      discount.value = 0;
      couponCode = "No Coupon Apply";
      isCouponApply = false;
      calculateAmount();
      CustomSnackBar(
        title: "Coupon Removed",
        message: "Coupon Code Changed: Previous Code Removed",
      );
    }
  }

  RxBool isAddLoading = false.obs;

  Future<void> addOrder({
    required String productId,
    required String address,
  }) async {
    try {
      isAddLoading.value = true;
      final url = Uri.parse(ConstantData.ADD_ORDER_API);
      var response = await http.post(
        url,
        body: {
          'uid': manager.getUserId(),
          'pid': productId,
          'amount': amount.value.toString(),
          'gst_amt': gst.value.toString(),
          'discount_amt': discount.value.toString(),
          'fees': fees.value.toString(),
          'total_amt': total_amount.value.toString(),
          'coupon_code': couponCode,
          'order_date':
              (DateFormat('dd-MM-yyyy').format(DateTime.now())).toString(),
          'order_time':
              (DateFormat('hh:mm a').format(DateTime.now())).toString(),
          'date': date.toString(),
          'time': time.toString(),
          'pay_type': pay_type,
          'address': address.toString(),
        },
      );

      if (response.statusCode == 200) {
        //log(response.body, name: "ADD ORDER");
        isAddLoading.value = false;
        Get.offAll(() => SuccessBookingScreen());
      }
    } catch (e) {
      log(e.toString(), name: "ORDER ADD ERROR");
      isAddLoading.value = false;
    }
  }

  RxBool isGetLoading = false.obs;

  OrderModel? model;

  Future<void> getOrders() async {
    isGetLoading.value = true;
    try {
      final url = Uri.parse(ConstantData.GET_ORDER_API);
      var response = await http.post(
        url,
        body: {'uid': manager.getUserId()},
      );
      if (response.statusCode == 200) {
        isGetLoading.value = false;
        model = orderModelFromJson(response.body);
        //log(response.body, name: "GET ORDER");
      }
    } catch (e, d) {
      isGetLoading.value = false;
      log(e.toString(), name: "ORDER GET ERROR");
      log(d.toString(), name: "ORDER GET ERROR");
    }
  }
}
