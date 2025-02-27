import 'dart:developer';

import 'package:elite_assist/generated/const_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/banner_model.dart';

class BannerController extends GetxController {
  RxBool isLoading = false.obs;
  BannerModel? bannerModel;

  @override
  void onInit() {
    getBanner();
    super.onInit();
  }

  RxInt currentIndex = 0.obs;

  Future<void> getBanner() async {
    isLoading.value = true;
    try {
      final url = Uri.parse(ConstantData.BANNER_API);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        bannerModel = bannerModelFromJson(response.body);
        //log(response.body, name: "BANNER");
        isLoading.value = false;
      }
    } catch (e) {
      log(e.toString(), name: "SERVER ERROR");
      isLoading.value = false;
    }
  }
}
