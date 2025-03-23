import 'package:elite_assist/common_ui/custom_appbar.dart';
import 'package:elite_assist/controller/person_controller.dart';
import 'package:elite_assist/generated/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _key = GlobalKey<FormState>();
  final controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: 'Register'),
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
                          'Register Now,',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Create your account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 34),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Form(
                      key: _key,
                      child: SingleChildScrollView(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 40),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              textCapitalization: TextCapitalization.words,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              validator: (name) {
                                if (name == null || name.trim().isEmpty) {
                                  return 'Fill Name';
                                } else if (!Validations.isValidName(name)) {
                                  return 'Only Alphabets Allowed';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                labelStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              validator: (email) {
                                if (email == null || email.trim().isEmpty) {
                                  return 'Fill Email Address';
                                } else if (!Validations.isValidEmail(email)) {
                                  return 'Enter Valid Email Address';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              decoration: InputDecoration(
                                labelText: 'Contact Number',
                                labelStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(),
                              ),
                              validator: (contact) {
                                if (contact == null || contact.trim().isEmpty) {
                                  return 'Fill Contact Number';
                                } else if (!Validations.isValidContact(
                                    contact)) {
                                  return 'Enter Valid Contact Number';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            Obx(
                              () => TextFormField(
                                controller: controller.passwordController,
                                obscureText: controller.obscurePassword.value,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.white),
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
                              () => TextFormField(
                                obscureText: controller.obscureCpassword.value,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(Icons.password),
                                  suffixIcon: IconButton(
                                    onPressed: controller.visibleCpassword,
                                    icon: controller.obscureCpassword.value
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (cPassword) {
                                  String password =
                                      controller.passwordController.text.trim();
                                  if (cPassword == null ||
                                      cPassword.trim().isEmpty) {
                                    return 'Fill Confirm Password';
                                  } else if (cPassword != password) {
                                    return 'Password Not Match';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Obx(
                              () => controller.isUserReg.value
                                  ? CircularProgressIndicator.adaptive()
                                  : Container(
                                      width: double.infinity,
                                      child: FilledButton(
                                        onPressed: () {
                                          if (_key.currentState!.validate()) {
                                            _key.currentState!.save();
                                            controller.registerUser();
                                          }
                                        },
                                        child: Text('Register'),
                                      ),
                                    ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                FilledButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.clear();
                                  },
                                  child: Text('Login'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      // Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextField(
      //         controller: controller.nameController,
      //         decoration: InputDecoration(
      //           labelText: 'Name',
      //           border: OutlineInputBorder(),
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       TextField(
      //         controller: controller.emailController,
      //         keyboardType: TextInputType.emailAddress,
      //         decoration: InputDecoration(
      //           labelText: 'E-Mail Address',
      //           border: OutlineInputBorder(),
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       TextField(
      //         controller: controller.contactController,
      //         keyboardType: TextInputType.phone,
      //         decoration: InputDecoration(
      //           labelText: 'Contact Number',
      //           border: OutlineInputBorder(),
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       TextField(
      //         controller: controller.passwordController,
      //         decoration: InputDecoration(
      //           labelText: 'Password',
      //           border: OutlineInputBorder(),
      //         ),
      //       ),
      //       SizedBox(height: 20),
      //       Obx(
      //         () => controller.isUserReg.value
      //             ? CircularProgressIndicator.adaptive()
      //             : Container(
      //                 width: double.infinity,
      //                 child: FilledButton(
      //                   onPressed: controller.registerUser,
      //                   child: Text('Register'),
      //                 ),
      //               ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
