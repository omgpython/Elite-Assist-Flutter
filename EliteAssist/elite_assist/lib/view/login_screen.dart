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
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 34, vertical: 34),
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
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            //color: Colors.grey,
                            child: Form(
                              key: _key,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: controller.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      prefixIcon: Icon(Icons.email),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.grey),
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
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        hintText: 'Password',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        suffixIcon: IconButton(
                                          onPressed: controller.visiblePassword,
                                          icon: controller.obscurePassword.value
                                              ? Icon(Icons.visibility_off)
                                              : Icon(Icons.visibility),
                                        ),
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
                                      FilledButton(
                                        onPressed: () {},
                                        child: Text('Sign In'),
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

      // SafeArea(
      //   child: Container(
      //     decoration: BoxDecoration(
      //       image: DecorationImage(
      //         image: AssetImage(Assets.imagesLogin),
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //     padding: EdgeInsets.symmetric(horizontal: 10),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         TextField(
      //           controller: controller.emailController,
      //           decoration: InputDecoration(
      //             labelText: 'E-Mail Address',
      //             border: OutlineInputBorder(),
      //           ),
      //         ),
      //         SizedBox(height: 10),
      //         TextField(
      //           controller: controller.passwordController,
      //           decoration: InputDecoration(
      //             labelText: 'Password',
      //             border: OutlineInputBorder(),
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //         Obx(
      //           () => controller.isUserLogin.value
      //               ? CircularProgressIndicator.adaptive()
      //               : Container(
      //                   width: double.infinity,
      //                   child: FilledButton(
      //                     onPressed: controller.loginUser,
      //                     child: Text('Login'),
      //                   ),
      //                 ),
      //         ),
      //         SizedBox(height: 25),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text("Don't Have An Account?"),
      //             TextButton(
      //               onPressed: () {
      //                 Get.to(RegisterScreen());
      //               },
      //               child: Text('Create Account'),
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
