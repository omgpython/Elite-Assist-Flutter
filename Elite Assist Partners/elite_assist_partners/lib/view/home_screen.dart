import 'package:elite_assist_partners/generated/const_data.dart';
import 'package:elite_assist_partners/generated/pref_manager.dart';
import 'package:elite_assist_partners/view/pending_order_screen.dart';
import 'package:elite_assist_partners/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../generated/fonts.dart';
import 'completed_order_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  PrefManager manager = PrefManager();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.grey),
          title: Text("Orders", style: TextStyle(fontFamily: Fonts.BebasNeue)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ProfileScreen());
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    ConstantData.SERVER_ADDRESS + manager.getPic(),
                  ),
                ),
              ),
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5,
            tabs: [Tab(text: "Pending"), Tab(text: "Completed")],
          ),
        ),
        body: TabBarView(
          children: [PendingOrderScreen(), CompletedOrderScreen()],
        ),
      ),
    );
  }
}
