import 'package:elite_assist_partners/generated/pref_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../common_ui/custom_appbar.dart';
import '../generated/const_data.dart';
import '../generated/fonts.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  PrefManager manager = PrefManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: 'Profile'),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: CircleAvatar(
                    radius: 56,
                    backgroundColor: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: ClipOval(
                        child: Image.network(
                          ConstantData.SERVER_ADDRESS + manager.getPic(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      manager.getName(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: Fonts.BonaNovaSC,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      "+91 ${manager.getContact()}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: Fonts.BonaNovaSC,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              //height: MediaQuery.of(context).size.height * .59,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                children: [
                  CustomListTile(
                    leading: Icons.support_agent,
                    tittle: 'Contact US',
                    onTap: () {
                      //Get.to(() => ContactUsScreen());
                    },
                  ),
                  CustomListTile(
                    leading: Icons.contact_support_outlined,
                    tittle: 'About US',
                    onTap: () {
                      //Get.to(() => AboutUsScreen());
                    },
                  ),
                  CustomListTile(
                    leading: Icons.privacy_tip_outlined,
                    tittle: 'Privacy Policy',
                    onTap: () {
                      //Get.to(() => PrivacyPolicyScreen());
                    },
                  ),
                  CustomListTile(
                    leading: Icons.policy,
                    tittle: 'Terms & Condition',
                    onTap: () {
                      //Get.to(() => TermsAndConditionScreen());
                    },
                  ),
                  CustomListTile(
                    leading: Icons.login,
                    tittle: 'Logout',
                    onTap: () {
                      showAlertDialog(context: context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CustomListTile({
    required IconData leading,
    required String tittle,
    required Function() onTap,
    IconData trailing = Icons.arrow_forward_ios,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: Icon(leading),
            title: Text(
              tittle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.BebasNeue,
              ),
            ),
            trailing: Icon(trailing),
          ),
          Divider(height: 2, color: Colors.grey),
        ],
      ),
    );
  }

  void showAlertDialog({required BuildContext context}) {
    PanaraConfirmDialog.show(
      context,
      title: "Logout",
      message: "Are sure want to logout?",
      confirmButtonText: "Sure",
      cancelButtonText: "Cancel",
      onTapCancel: Get.back,
      onTapConfirm: () {
        Get.offAll(() => LoginScreen());
      },
      panaraDialogType: PanaraDialogType.warning,
      barrierDismissible: false,
    );
  }
}
