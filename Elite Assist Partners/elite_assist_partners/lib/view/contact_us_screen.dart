import 'package:elite_assist_partners/generated/assets.dart';
import 'package:flutter/material.dart';

import '../common_ui/custom_appbar.dart';
import '../generated/fonts.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Contact Us'),
      body: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 0, width: double.infinity),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(height: 150, width: 150, Assets.imagesLogo),
          ),
          Text(
            'Support Contact: +91 12345 67890',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.BonaNovaSC,
            ),
          ),
          Text(
            'Support E-Mail: support@eliteassist.com',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.BonaNovaSC,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Develop By: Harshal Jariwala',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.BonaNovaSC,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
