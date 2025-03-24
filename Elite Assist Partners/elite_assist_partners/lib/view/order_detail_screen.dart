import 'package:action_slider/action_slider.dart';
import 'package:elite_assist_partners/common_ui/custom_appbar.dart';
import 'package:elite_assist_partners/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_ui/custom_svg_icon.dart';
import '../common_ui/dashed_line.dart';
import '../controller/order_controller.dart';
import '../generated/assets.dart';
import '../generated/fonts.dart';

class OrderDetailScreen extends StatelessWidget {
  Order order;
  OrderDetailScreen({super.key, required this.order});

  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: order.pname),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            spacing: 12,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  width: width,
                  height: width / 1.5,
                  order.ppic,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
                ),
                child: Column(
                  children: [
                    Text(
                      'Service Details',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: Fonts.BebasNeue,
                      ),
                    ),
                    SizedBox(height: 5),
                    DashedLine(),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Picked Slot: ${order.date} | ${order.time}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.BonaNovaSC,
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: order.status == 1 ? true : false,
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                'Completed On: ${order.endDate} | ${order.endTime}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Fonts.BonaNovaSC,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              Visibility(
                visible: order.isAasign,
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Customer Details',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.BebasNeue,
                        ),
                      ),
                      SizedBox(height: 5),
                      DashedLine(),
                      SizedBox(height: 15),
                      Column(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 12,
                            children: [
                              Icon(Icons.person),
                              Text(
                                order.uname,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Fonts.BonaNovaSC,
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: order.status == 0 ? true : false,
                            child: Row(
                              spacing: 12,
                              children: [
                                CustomSvgIcon(image: Assets.iconsPhone),
                                Text(
                                  order.ucontact,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Fonts.BonaNovaSC,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            spacing: 12,
                            children: [
                              CustomSvgIcon(image: Assets.iconsAddress),
                              Container(
                                width: width / 1.4,
                                child: Text(
                                  order.address,
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
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Summary',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.BebasNeue,
                          ),
                        ),
                        Text(
                          "Mode: ${order.paymentType}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.BebasNeue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    DashedLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: Fonts.BonaNovaSC,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              order.paymentType == "ONLINE"
                                  ? "0"
                                  : order.totalAmount.toString(),
                              style: TextStyle(
                                fontSize: 23,
                                fontFamily: Fonts.BonaNovaSC,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.currency_rupee, size: 23),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: order.status == 0 ? true : false,
                child: ActionSlider.standard(
                  sliderBehavior: SliderBehavior.stretch,
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: Colors.grey.shade100,
                  toggleColor: Colors.black,
                  successIcon: Icon(Icons.check_rounded, color: Colors.white),
                  loadingIcon: CircularProgressIndicator(color: Colors.white),
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  action: (controller) async {
                    controller.loading();
                    await Future.delayed(Duration(seconds: 2));
                    controller.success();
                    await Future.delayed(Duration(seconds: 1));
                    controller.reset();
                    orderController.completeOrder(id: order.id);
                  },
                  child: Text(
                    'Slide To Complete',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: Fonts.BonaNovaSC,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
