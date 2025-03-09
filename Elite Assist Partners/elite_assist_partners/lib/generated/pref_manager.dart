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

  Future<void> spAddPartner({
    required String id,
    required String email,
    required String contact,
    required String pic,
    required String name,
  }) async {
    try {
      await pref!.setBool(ConstantData.IS_LOGIN_SP, true);
      await pref!.setString(ConstantData.KEY_ID_SP, id);
      await pref!.setString(ConstantData.KEY_CONTACT_SP, contact);
      await pref!.setString(ConstantData.KEY_EMAIL_SP, email);
      await pref!.setString(ConstantData.KEY_PIC_SP, pic);
      await pref!.setString(ConstantData.KEY_NAME_SP, name);
    } catch (e) {
      log(e.toString(), name: "SP ADD ERROR");
    }
  }

  Future<void> logoutPartner() async {
    await pref!.clear();
  }

  String getPic() {
    return pref!.getString(ConstantData.KEY_PIC_SP) ?? "";
  }

  String getId() {
    return pref!.getString(ConstantData.KEY_ID_SP) ?? "";
  }

  bool isLogin() {
    bool value = pref!.getBool(ConstantData.IS_LOGIN_SP) ?? false;
    return value;
  }
}
