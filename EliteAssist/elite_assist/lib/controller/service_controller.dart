import 'dart:developer';

import 'package:elite_assist/generated/const_data.dart';
import 'package:elite_assist/model/service_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServiceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getService();
  }

  RxBool isLoading = false.obs;
  ServiceModel? model;

  Future<void> getService() async {
    try {
      isLoading.value = true;
      final url = Uri.parse(ConstantData.SERVICE_API);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        //log(response.body, name: "SERVICE");
        model = serviceModelFromJson(response.body);
        isLoading.value = false;
      }
    } catch (e) {
      log(e.toString(), name: "SERVICE ERROR");
      isLoading.value = false;
    }
  }
}
