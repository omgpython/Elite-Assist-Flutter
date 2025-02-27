import 'dart:developer';

import 'package:elite_assist/generated/const_data.dart';
import 'package:elite_assist/model/coupon_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CouponController extends GetxController {
  @override
  void onInit() {
    getCoupon();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  CouponModel? model;

  Future<void> getCoupon() async {
    try {
      isLoading.value = true;
      final url = Uri.parse(ConstantData.COUPON_API);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //log(response.body, name: "COUPON");
        model = couponModelFromJson(response.body);
        isLoading.value = false;
      }
    } catch (e) {
      log(e.toString(), name: "COUPON SERVER ERROR");
      isLoading.value = false;
    }
  }
}
