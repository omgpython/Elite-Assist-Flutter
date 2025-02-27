import 'dart:async';

import 'package:elite_assist/view/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';

class SuccessBookingScreen extends StatelessWidget {
  SuccessBookingScreen({super.key});

  final controller = Get.put(SuccessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Assets.animSuccess),
          Obx(
            () => Text(
              'Redirect To Home in ${controller.sec} Sec ....',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuccessController extends GetxController {
  var sec = 5.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (sec.value > 0) {
        sec.value--;
      } else {
        _timer.cancel();
        Get.offAll(() => BottomNavScreen());
      }
    });
  }
}
