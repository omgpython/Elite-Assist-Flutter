import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  CustomSnackBar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.black,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
