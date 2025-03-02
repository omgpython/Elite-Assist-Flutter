import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:elite_assist/generated/const_data.dart';
import 'package:elite_assist/generated/pref_manager.dart';
import 'package:elite_assist/model/person_model.dart';
import 'package:elite_assist/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../view/bottom_nav_screen.dart';

class PersonController extends GetxController {
  PersonModel? model;
  PrefManager manager = PrefManager();

  @override
  void onInit() {
    super.onInit();
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController(text: "h@gmail.com");
  final passwordController = TextEditingController(text: "123123123");
  final contactController = TextEditingController();

  RxBool isUserReg = false.obs;

  Future<void> registerUser() async {
    try {
      isUserReg.value = true;
      final url = Uri.parse(ConstantData.CHECK_USER_API);
      var response = await http.post(
        url,
        body: {"email": emailController.text.trim()},
      );

      if (response.statusCode == 200 &&
          jsonDecode(response.body)["person"].toString() == "false") {
        final url1 = Uri.parse(ConstantData.REGISTER_USER_API);
        var response1 = await http.post(
          url1,
          body: {
            "username": nameController.text.trim(),
            "password": passwordController.text.trim(),
            "email": emailController.text.trim(),
            "phone": passwordController.text.trim(),
          },
        );
        if (response1.statusCode == 200) {
          isUserReg.value = false;
          //log(response1.body, name: "REG DATA");
          Get.snackbar(
            "Register Successfully",
            "Your account has created",
          );
          Get.offAll(() => LoginScreen());
        }
      } else {
        isUserReg.value = false;
        Get.snackbar(
          "Email Already Registered",
          "You must be login instead of register",
        );
      }
    } catch (e) {
      isUserReg.value = false;
      log(e.toString(), name: "REGISTER ERROR");
    }
  }

  RxBool isUserLogin = false.obs;

  Future<void> loginUser() async {
    isUserLogin.value = true;
    try {
      final url = Uri.parse(ConstantData.LOGIN_USER_API);
      var response = await http.post(url, body: {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      });
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["status"].toString() == "true") {
        model = PersonModel.fromJson(jsonDecode(response.body));
        isUserLogin.value = false;
        manager.spAddUser(
          id: model!.person.id,
          email: model!.person.email,
          contact: model!.person.phone.toString(),
          name: model!.person.username,
        );
        isUserLogin.value = false;
        Get.snackbar(
          'Login Successfully',
          'Welcome, ${model!.person.username}',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        Get.offAll(() => BottomNavScreen());
      } else {
        isUserLogin.value = false;
        Get.snackbar(
          'Incorrect',
          'Please Check Email or Password',
        );
      }
    } catch (e) {
      log(e.toString(), name: "ERROR");
      isUserLogin.value = false;
    }
  }

  @override
  void onClose() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    contactController.clear();
    super.onClose();
  }
}
