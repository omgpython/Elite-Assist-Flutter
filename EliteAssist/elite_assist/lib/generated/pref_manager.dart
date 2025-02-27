import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'const_data.dart';

class PrefManager {
  static final _instance = PrefManager._internal();
  SharedPreferences? pref;

  Future<void> init() async {
    pref ??= await SharedPreferences.getInstance();
  }

  factory PrefManager() {
    return _instance;
  }

  PrefManager._internal();

  Future<void> spAddUser({
    required String id,
    required String email,
    required String contact,
    required String name,
  }) async {
    try {
      await pref!.setBool(ConstantData.IS_LOGIN_SP, true);
      await pref!.setString(ConstantData.KEY_ID_SP, id);
      await pref!.setString(ConstantData.KEY_CONTACT_SP, contact);
      await pref!.setString(ConstantData.KEY_EMAIL_SP, email);
      await pref!.setString(ConstantData.KEY_NAME_SP, name);
    } catch (e) {
      log(e.toString(), name: "SP ERROR");
    }
  }

  bool isLogin() {
    bool value = pref!.getBool(ConstantData.IS_LOGIN_SP) ?? false;
    return value;
  }

  String getUserName() {
    return pref!.getString(ConstantData.KEY_NAME_SP) ?? "User";
  }

  String getUserId() {
    return pref!.getString(ConstantData.KEY_ID_SP) ?? "0";
  }

  String getEmail() {
    return pref!.getString(ConstantData.KEY_EMAIL_SP) ?? "user@gmail.com";
  }

  String getContact() {
    return pref!.getString(ConstantData.KEY_CONTACT_SP) ?? "00";
  }

  Future<void> logoutUser() async {
    await pref!.clear();
  }
}
