import 'package:elite_assist/controller/person_controller.dart';
import 'package:elite_assist/generated/pref_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_ui/custom_appbar.dart';
import '../generated/assets.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  PrefManager manager = PrefManager();
  final controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    setValue();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile',
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          spacing: 12,
          children: [
            CircleAvatar(
              radius: 56,
              backgroundColor: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: ClipOval(
                  child: Image.asset(Assets.imagesUser),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              enabled: false,
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'E-Mail Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            TextField(
              controller: controller.nameController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            TextField(
              controller: controller.contactController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: controller.isUserEdit.value
                  ? Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : FilledButton(
                      onPressed: () {
                        controller.editUser();
                      },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: Text('Edit Details'),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void setValue() {
    controller.nameController.text = manager.getUserName();
    controller.emailController.text = manager.getEmail();
    controller.contactController.text = manager.getContact();
  }
}
