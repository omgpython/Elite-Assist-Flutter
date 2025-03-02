import 'dart:async';

import 'package:elite_assist/generated/assets.dart';
import 'package:elite_assist/generated/pref_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'bottom_nav_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  PrefManager manager = PrefManager();

  @override
  Widget build(BuildContext context) {
    checkIsLogin();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Lottie.asset(Assets.animSplash),
        ),
      ),
    );
  }

  Future<void> checkIsLogin() async {
    bool value = manager.isLogin();
    Timer(
      Duration(seconds: 5),
      () {
        if (value) {
          Get.offAll(() => BottomNavScreen());
        } else {
          Get.offAll(() => LoginScreen());
        }
      },
    );
  }
}
