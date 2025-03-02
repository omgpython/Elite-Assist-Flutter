import 'dart:developer';

import 'package:elite_assist/generated/const_data.dart';
import 'package:elite_assist/model/sub_service_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SubServiceController extends GetxController {
  String id;
  RxInt selectedIndex = 0.obs;

  SubServiceController({required this.id});

  @override
  void onInit() {
    getSubServices();
    super.onInit();
  }

  SubServiceModel? model;
  RxBool isLoading = false.obs;

  Future<void> getSubServices() async {
    try {
      isLoading.value = true;
      final url = Uri.parse(ConstantData.GET_SUB_SERVICE_API);

      var response = await http.post(url, body: {"id": id});

      if (response.statusCode == 200) {
        model = subServiceModelFromJson(response.body);
        //log(response.body, name: "SUB_SERVICE");
        isLoading.value = false;
      }
    } catch (e) {
      log(e.toString(), name: "SUB_SERVICE_ERROR");
      isLoading.value = false;
    }
  }
}
