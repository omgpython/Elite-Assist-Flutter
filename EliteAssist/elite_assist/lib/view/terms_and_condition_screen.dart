import 'package:elite_assist/common_ui/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../generated/fonts.dart';

class TermsAndConditionScreen extends StatelessWidget {
  TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Terms & Conditions'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            terms,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.Roboto,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  String terms = "These Terms and Conditions govern your use of the Elite Assist mobile application and the services provided therein. By accessing or using the App, you agree to be bound by these Terms. If you do not agree with any part of these Terms, you may not use the App.\n" +
      "\n" +
      "Use of the App :\n" +
      "\n" +
      "Registration: In order to access certain features of the App, you may be required to register an account. You agree to provide accurate and complete information during the registration process and to keep your account credentials confidential.\n" +
      "\n" +
      "User Conduct: You agree to use the App in accordance with all applicable laws and regulations. You further agree not to:\n" +
      "\n" +
      "Use the App for any unlawful purpose or in any way that violates these Terms.\n" +
      "Interfere with the operation of the App or attempt to gain unauthorized access to any portion of the App.\n" +
      "Upload or transmit any content that is harmful, offensive, or violates the rights of others.\n" +
      "Service Bookings: The App allows you to book services offered by third-party service providers. By booking a service through the App, you agree to abide by the terms and conditions set forth by the service provider.\n" +
      "\n" +
      "Intellectual Property :\n" +
      "\n" +
      "Ownership: All content and materials available on the App, including but not limited to text, graphics, logos, and images, are the property of Elite Assist or its licensors and are protected by copyright and other intellectual property laws.\n" +
      "\n" +
      "License: Subject to these Terms, Elite Assist grants you a limited, non-exclusive, and non-transferable license to access and use the App for your personal, non-commercial use.\n" +
      "\n" +
      "Disclaimer of Warranties :\n" +
      "\n" +
      "No Warranty: The App is provided on an \"as is\" and \"as available\" basis, without any warranties of any kind, either express or implied. Elite Assist does not warrant that the App will be uninterrupted, error-free, or free of viruses or other harmful components.\n" +
      "\n" +
      "Use at Your Own Risk: You use the App at your own risk. Elite Assist shall not be liable for any damages arising out of or in connection with your use of the App.\n" +
      "\n" +
      "Limitation of Liability :\n" +
      "\n" +
      "In no event shall Elite Assist or its affiliates be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with these Terms or your use of the App, even if Elite Assist has been advised of the possibility of such damages.\n" +
      "\n" +
      "Changes to These Terms :\n" +
      "\n" +
      "Elite Assist reserves the right to update or change these Terms at any time without prior notice. It is your responsibility to review these Terms periodically for changes. Your continued use of the App following the posting of any changes constitutes acceptance of those changes.\n" +
      "\n" +
      "Governing Law :\n" +
      "\n" +
      "These Terms shall be governed by and construed in accordance with the laws of without regard to its conflict of law provisions.\n" +
      "\n" +
      "Last updated: February - 2025";
}
