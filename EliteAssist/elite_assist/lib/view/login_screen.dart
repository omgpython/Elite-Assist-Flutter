import 'package:elite_assist/controller/person_controller.dart';
import 'package:elite_assist/generated/assets.dart';
import 'package:elite_assist/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesLogin),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'E-Mail Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => controller.isUserLogin.value
                    ? CircularProgressIndicator.adaptive()
                    : Container(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: controller.loginUser,
                          child: Text('Login'),
                        ),
                      ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account?"),
                  TextButton(
                    onPressed: () {
                      Get.to(RegisterScreen());
                    },
                    child: Text('Create Account'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
