import 'dart:developer';

import 'package:elite_assist_partners/generated/const_data.dart';
import 'package:elite_assist_partners/generated/pref_manager.dart';
import 'package:elite_assist_partners/view/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/order_model.dart';

class OrderController extends GetxController {
  PrefManager manager = PrefManager();

  OrderModel? model0;
  RxBool isPendingLoading = false.obs;
  Future<void> getPendingOrders() async {
    isPendingLoading.value = true;
    try {
      final url = Uri.parse(ConstantData.ORDER_API);
      var response = await http.post(
        url,
        body: {"id": manager.getId(), "status": "0"},
      );
      if (response.statusCode == 200) {
        isPendingLoading.value = false;
        model0 = orderModelFromJson(response.body);
        //log(response.body, name: "PENDING ORDERS");
      }
    } catch (e) {
      isPendingLoading.value = false;
      log(e.toString(), name: "PENDING SERVER ERROR");
    }
  }

  OrderModel? model1;
  RxBool isCompletedLoading = false.obs;
  Future<void> getCompletedOrders() async {
    isCompletedLoading.value = true;
    try {
      final url = Uri.parse(ConstantData.ORDER_API);
      var response = await http.post(
        url,
        body: {"id": manager.getId(), "status": "1"},
      );
      if (response.statusCode == 200) {
        isCompletedLoading.value = false;
        model1 = orderModelFromJson(response.body);
        //log(response.body, name: "Completed ORDERS");
      }
    } catch (e) {
      isCompletedLoading.value = false;
      log(e.toString(), name: "Completed SERVER ERROR");
    }
  }

  Future<void> completeOrder({required String id}) async {
    try {
      final url = Uri.parse(ConstantData.COMPLETE_ORDER_API);
      var response = await http.post(url, body: {"id": id});

      if (response.statusCode == 200) {
        log(response.body, name: "COMPLETE ORDER");
        Get.offAll(() => HomeScreen());
      }
    } catch (e) {
      log(e.toString(), name: "COMPLETE SERVER ERROR");
    }
  }
}
