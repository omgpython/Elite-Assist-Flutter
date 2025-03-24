import 'package:elite_assist/controller/person_controller.dart';
import 'package:elite_assist/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/validations.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(PersonController());
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 34),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Welcome Back,',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'We missed you! Login to get started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 34, vertical: 84),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            //color: Colors.grey,
                            child: Form(
                              key: _key,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: controller.emailController,
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'E-Mail Address',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      prefixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (email) {
                                      if (email == null ||
                                          email.trim().isEmpty) {
                                        return 'Fill Email Address';
                                      } else if (!Validations.isValidEmail(
                                          email)) {
                                        return 'Enter Valid Email Address';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 16),
                                  Obx(
                                    () => TextFormField(
                                      controller: controller.passwordController,
                                      obscureText:
                                          controller.obscurePassword.value,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        prefixIcon: Icon(Icons.password),
                                        suffixIcon: IconButton(
                                          onPressed: controller.visiblePassword,
                                          icon: controller.obscurePassword.value
                                              ? Icon(Icons.visibility_off)
                                              : Icon(Icons.visibility),
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (password) {
                                        if (password == null ||
                                            password.trim().isEmpty) {
                                          return 'Fill Password';
                                        } else if (!Validations.isValidPassword(
                                            password)) {
                                          return 'Enter Valid Password';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Obx(
                                    () => controller.isUserLogin.value
                                        ? CircularProgressIndicator.adaptive()
                                        : Container(
                                            width: double.infinity,
                                            child: FilledButton(
                                              onPressed: () {
                                                if (_key.currentState!
                                                    .validate()) {
                                                  _key.currentState!.save();
                                                  controller.loginUser();
                                                }
                                              },
                                              child: Text('Login'),
                                            ),
                                          ),
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Need Help?',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text('Forgot Password'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have account?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => RegisterScreen());
                              },
                              child: Text(
                                'Register Instead',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
