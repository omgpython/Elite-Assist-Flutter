import 'package:elite_assist_partners/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generated/pref_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
