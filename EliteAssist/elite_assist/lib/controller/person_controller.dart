import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:elite_assist/common_ui/custom_snackbar.dart';
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

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final contactController = TextEditingController();

  RxBool isUserReg = false.obs;

  Future<void> registerUser() async {
    try {
      final url = Uri.parse(ConstantData.REGISTER_USER_API);

      var response = await http.post(
        url,
        body: {
          "username": nameController.text.trim(),
          "password": passwordController.text.trim(),
          "email": emailController.text.trim(),
          "phone": contactController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        isUserReg.value = false;
        log(response.body, name: "SERVER DATA");
        model = personModelFromJson(response.body);
        if (model!.status) {
          CustomSnackBar(
            title: "Register Successfully",
            message: "Your account has created",
          );
          clear();
          Get.offAll(() => LoginScreen());
        } else {
          isUserReg.value = false;
          CustomSnackBar(
            title: "Email Already Registered",
            message: "You must be login instead of register",
          );
        }
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
          id: model!.person.id.toString(),
          email: model!.person.email.toString(),
          contact: model!.person.phone.toString(),
          name: model!.person.username.toString(),
        );
        clear();
        CustomSnackBar(
          title: 'Login Successfully',
          message: 'Welcome, ${model!.person.username}',
        );
        Get.offAll(() => BottomNavScreen());
      } else {
        isUserLogin.value = false;
        CustomSnackBar(
          title: 'Incorrect',
          message: 'Please Check Email or Password',
        );
        clear();
      }
    } catch (e) {
      log(e.toString(), name: "LOGIN ERROR");
      isUserLogin.value = false;
    }
  }

  RxBool isUserEdit = false.obs;

  Future<void> editUser() async {
    isUserEdit.value = true;
    try {
      final url = Uri.parse(ConstantData.EDIT_USER_API);
      var response = await http.post(url, body: {
        "id": manager.getUserId(),
        "username": nameController.text.trim(),
        "phone": contactController.text.trim(),
      });

      if (response.statusCode == 200) {
        isUserEdit.value = false;
        Get.back(result: true);
        manager.spEditUser(
          contact: contactController.text.trim(),
          name: nameController.text.trim(),
        );
        CustomSnackBar(
          title: "Information Update Success",
          message: "Your information has been successfully updated.",
        );
        clear();
      }
    } catch (e) {
      isUserEdit.value = false;
      log(e.toString(), name: "UPDATE USER ERROR");
    }
  }

  RxString userName = "".obs;

  String getUserName() {
    userName.value = manager.getUserName();
    return userName.value;
  }

  RxBool obscurePassword = true.obs, obscureCpassword = true.obs;

  void visiblePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void visibleCpassword() {
    obscureCpassword.value = !obscureCpassword.value;
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    contactController.clear();
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
