import 'dart:developer';

import 'package:elite_assist_partners/generated/const_data.dart';
import 'package:elite_assist_partners/model/partner_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common_ui/custom_snackbar.dart';
import '../generated/pref_manager.dart';
import '../view/home_screen.dart';

class PartnerController extends GetxController {
  final mobileNoController = TextEditingController();

  PartnerModel? model;
  PrefManager manager = PrefManager();

  RxBool isLogin = false.obs;
  Future<void> loginPartner() async {
    isLogin.value = true;
    final url = Uri.parse(ConstantData.LOGIN_API);
    var response = await http.post(
      url,
      body: {'mobile_no': mobileNoController.text.trim()},
    );
    if (response.statusCode == 200) {
      isLogin.value = false;
      //log(response.body, name: "LOGIN RESPONSE");
      try {
        model = partnerModelFromJson(response.body);
        if (model!.status) {
          String pic = model!.partner.partnerPic.split("8000/").last;
          manager.spAddPartner(
            id: model!.partner.id.toString(),
            email: model!.partner.emailId.toString(),
            contact: model!.partner.mobileNo.toString(),
            name: model!.partner.partnerName.toString(),
            pic: pic,
          );
          CustomSnackBar(
            title: 'Login Successfully',
            message: 'Welcome, ${model!.partner.partnerName}',
          );
          Get.offAll(() => HomeScreen());
        } else {
          CustomSnackBar(
            title: 'Incorrect',
            message: 'Please Check Mobile Number',
          );
        }
      } catch (e) {
        isLogin.value = true;
        log(e.toString(), name: "LOGIN ERROR");
      }
    }
  }
}
