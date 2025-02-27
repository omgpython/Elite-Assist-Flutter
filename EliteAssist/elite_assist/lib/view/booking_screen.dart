import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../generated/fonts.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
        ),
        title: Center(
          child: Text(
            'Bookings',
            style: TextStyle(
              color: Colors.white,
              fontFamily: Fonts.BebasNeue,
            ),
          ),
        ),
      ),
    );
  }
}
