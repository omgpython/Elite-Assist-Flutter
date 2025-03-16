import 'package:elite_assist/common_ui/custom_appbar.dart';
import 'package:elite_assist/view/booking_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/booking_controller.dart';
import '../generated/fonts.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    controller.getOrders();
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Bookings'),
      body: RefreshIndicator(
        onRefresh: controller.getOrders,
        child: Obx(
          () {
            if (controller.isGetLoading.value) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else {
              return ListView.builder(
                itemCount: controller.model!.order.length,
                itemBuilder: (context, index) {
                  var data = controller.model!.order[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => BookingDetailScreen(
                          data: data,
                          serviceName: data.pname,
                        ),
                      );
                    },
                    child: Card(
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
                              Container(
                                width: width * .3,
                                decoration: BoxDecoration(
                                  color: data.status == 0
                                      ? Colors.yellow.shade700
                                      : Colors.green.shade400,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: EdgeInsets.all(4),
                                child: Center(
                                  child: Text(
                                    data.status == 0 ? 'Pending' : 'Completed',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Fonts.BonaNovaSC,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
