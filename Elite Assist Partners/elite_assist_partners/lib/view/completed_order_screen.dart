import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/order_controller.dart';
import '../generated/fonts.dart';
import 'order_detail_screen.dart';

class CompletedOrderScreen extends StatelessWidget {
  CompletedOrderScreen({super.key});

  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    controller.getCompletedOrders();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: controller.getCompletedOrders,
        child: Obx(() {
          if (controller.isCompletedLoading.value) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (controller.model1 == null ||
              controller.model1!.order.isEmpty) {
            return Center(child: Text("No completed orders available."));
          } else {
            return ListView.builder(
              itemCount: controller.model1!.order.length,
              itemBuilder: (context, index) {
                var data = controller.model1!.order[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => OrderDetailScreen(order: data));
                  },
                  child: Card(
                    elevation: 20,
                    child: Row(
                      spacing: 12,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image.network(
                            width: width * .35,
                            height: width * .35,
                            data.ppic,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width * .5,
                              child: Text(
                                data.pname,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Fonts.BonaNovaSC,
                                ),
                              ),
                            ),
                            Container(
                              width: width * .5,
                              child: Text(
                                '${data.date} | ${data.time}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Fonts.BonaNovaSC,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
