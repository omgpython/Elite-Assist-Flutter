import 'package:elite_assist_partners/common_ui/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../generated/fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Privacy Policy'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            privacyPolicy,
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

  String privacyPolicy =
      "This Privacy Policy outlines how Elite Assist we,collects, uses, maintains, and discloses information obtained from users of the Elite Assist mobile application. By using the App, you agree to the terms outlined in this Privacy Policy.\n" +
      "\n" +
      "Information We Collect : \n" +
      "\n" +
      "Personal Information: When you register an account or use our services, we may collect personal information such as your name, email address, phone number, and address.\n" +
      "\n" +
      "Usage Information: We may collect information about how you interact with the App, including pages visited, features used, and preferences selected.\n" +
      "\n" +
      "Device Information: We may collect information about the device you use to access the App, including device type, operating system, and unique device identifiers.\n" +
      "\n" +
      "Location Information: With your consent, we may collect location information to provide location-based services such as finding nearby service providers.\n" +
      "\n" +
      "How We Use Your Information : \n" +
      "\n" +
      "To Provide Services: We use the information collected to deliver the services you request, such as booking appointments and communicating with service providers.\n" +
      "\n" +
      "To Personalize Your Experience: We may use your information to personalize your experience within the App, such as recommending services based on your preferences.\n" +
      "\n" +
      "To Improve Our Services: We analyze user data to understand how our services are used and to identify areas for improvement.\n" +
      "\n" +
      "To Communicate With You: We may use your contact information to send you updates, notifications, and promotional messages related to our services.\n" +
      "\n" +
      "Information Sharing : \n" +
      "\n" +
      "We do not sell, trade, or rent your personal information to third parties. We may share your information with trusted service providers who assist us in operating our business, such as payment processors and cloud service providers. We may also disclose your information in response to legal requests or to protect our rights and interests.\n" +
      "\n" +
      "Data Security : \n" +
      "\n" +
      "We take reasonable measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, please be aware that no method of transmission over the internet or electronic storage is 100% secure.\n" +
      "\n" +
      "Changes to This Privacy Policy : \n" +
      "\n" +
      "We reserve the right to update or change this Privacy Policy at any time. We will notify you of any changes by posting the new Privacy Policy on this page. It is your responsibility to review this Privacy Policy periodically for changes.\n" +
      "\n" +
      "Last updated: February - 2025";
}
