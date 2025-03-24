import 'package:elite_assist_partners/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/partner_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(PartnerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesLogin),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.mobileNoController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                ),
              ),
              Obx(() {
                if (controller.isLogin.value) {
                  return Center(child: CircularProgressIndicator.adaptive());
                } else {
                  return Container(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: controller.loginPartner,
                      child: Text('Login'),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
