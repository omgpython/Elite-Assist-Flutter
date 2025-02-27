import 'package:elite_assist/generated/assets.dart';
import 'package:elite_assist/generated/fonts.dart';
import 'package:elite_assist/generated/pref_manager.dart';
import 'package:elite_assist/view/about_us_screen.dart';
import 'package:elite_assist/view/address_screen.dart';
import 'package:elite_assist/view/contact_us_screen.dart';
import 'package:elite_assist/view/faq_screen.dart';
import 'package:elite_assist/view/login_screen.dart';
import 'package:elite_assist/view/privacy_policy_screen.dart';
import 'package:elite_assist/view/terms_and_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  PrefManager manager = PrefManager();

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: Fonts.BebasNeue,
          ),
        ),
      ),
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
                        child: Image.asset(Assets.imagesUser),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      manager.getUserName(),
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
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      manager.getEmail(),
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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Edit Profile'),
                  ),
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
                    leading: Icons.home,
                    tittle: 'My Addresses',
                    onTap: () {
                      Get.to(() => AddressScreen());
                    },
                  ),
                  CustomListTile(
                    leading: Icons.support_agent,
                    tittle: 'Contact US',
                    onTap: () {
                      Get.to(() => ContactUsScreen());
                    },
                  ),
                  CustomListTile(
                    leading: Icons.contact_support_outlined,
                    tittle: 'About US',
                    onTap: () {
                      Get.to(() => AboutUsScreen());
                    },
                  ),
                  CustomListTile(
                    leading: IconData(0xe4fa, fontFamily: 'MaterialIcons'),
                    tittle: 'Frequently Asked Questions (FAQS)',
                    onTap: () {
                      Get.to(() => FaqScreen());
                    },
                  ),
                  CustomListTile(
                    leading: Icons.privacy_tip_outlined,
                    tittle: 'Privacy Policy',
                    onTap: () {
                      Get.to(() => PrivacyPolicyScreen());
                    },
                  ),
                  CustomListTile(
                    leading: Icons.policy,
                    tittle: 'Terms & Condition',
                    onTap: () {
                      Get.to(() => TermsAndConditionScreen());
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
          Divider(
            height: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Future<void> init() async {
    await manager.init();
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
        manager.logoutUser();
        Get.offAll(() => LoginScreen());
      },
      panaraDialogType: PanaraDialogType.normal,
      barrierDismissible: false,
    );
  }
}
