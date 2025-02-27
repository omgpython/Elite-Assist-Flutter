import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../generated/fonts.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
        ),
        title: Text(
          'About US',
          style: TextStyle(
            fontFamily: Fonts.BebasNeue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            aboutUs,
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

  String aboutUs = "At Elite Assist, we understand the value of your time and the importance of hassle-free service experiences. Whether you're looking for home maintenance, beauty services, wellness treatments, or any other assistance, Elite Assist is here to cater to your needs.\n"
          "\n" +
      "Our Mission :\n" +
      "\n" +
      "Our mission at Elite Assist is to revolutionize the way you access services by providing a seamless platform that connects you with trusted partners who deliver exceptional service experiences. We strive to make your life easier by offering a wide range of services that can be booked at your convenience, all through our user-friendly mobile app.\n" +
      "\n" +
      "Why Choose Elite Assist? :\n" +
      "\n" +
      "Convenience: With Elite Assist, you can book services anytime, anywhere, with just a few taps on your phone. Say goodbye to lengthy phone calls and waiting times.\n" +
      "\n" +
      "Quality Assurance: We handpick our partners to ensure that they meet our high standards of quality and professionalism. You can trust that every service booked through Elite Assist will be delivered with excellence.\n" +
      "\n" +
      "Safety & Security: Your safety is our top priority. We conduct thorough background checks on all our partners and implement stringent safety measures to ensure a secure service experience.\n" +
      "\n" +
      "Personalized Experience: Our app is designed to provide a personalized experience tailored to your preferences. Easily browse through services, view partner profiles, and book appointments that suit your schedule.\n" +
      "\n" +
      "Our Team : \n" +
      "\n" +
      "Behind Elite Assist is a dedicated team of professionals committed to making your service booking experience seamless and enjoyable. From developers to customer support representatives, every member of our team works tirelessly to ensure that you receive the best possible service.\n" +
      "\n" +
      "Get Started with Elite Assist : \n" +
      "\n" +
      "Download the Elite Assist app today and experience the future of service booking. Join thousands of satisfied customers who rely on Elite Assist for all their service needs.\n" +
      "\n" +
      "Thank you for choosing Elite Assist. We look forward to serving you!";
}
