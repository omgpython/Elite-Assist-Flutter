import 'package:elite_assist/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'booking_screen.dart';
import 'home_screen.dart';
import 'offer_screen.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: [
        HomeScreen(),
        OfferScreen(),
        BookingScreen(),
        ProfileScreen(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          title: 'Home',
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.local_offer, color: Colors.white),
          title: 'Offer',
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.calendar_month, color: Colors.white),
          title: 'Booking',
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person, color: Colors.white),
          title: 'Profile',
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.white,
        )
      ],
      navBarStyle: NavBarStyle.style13,
      backgroundColor: Colors.black,
    );
  }
}
