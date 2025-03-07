import 'package:elite_assist/common_ui/custom_appbar.dart';
import 'package:elite_assist/common_ui/custom_svg_icon.dart';
import 'package:elite_assist/generated/assets.dart';
import 'package:elite_assist/model/order_model.dart';
import 'package:flutter/material.dart';

import '../common_ui/dashed_line.dart';
import '../generated/fonts.dart';

class BookingDetailScreen extends StatelessWidget {
  Order data;
  String serviceName;

  BookingDetailScreen(
      {super.key, required this.data, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: serviceName),
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
                  data.ppic,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                    ),
                  ],
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
                          'Booked On: ${data.orderDate} | ${data.orderTime}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.BonaNovaSC,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Picked Slot: ${data.date} | ${data.time}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.BonaNovaSC,
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: data.status == 1 ? true : false,
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                'Completed On: ${data.endDate} | ${data.endTime}',
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
                visible: data.isAasign,
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Partner Details',
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
                        spacing: 12,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              height: 130,
                              width: 130,
                              data.partnerPic,
                            ),
                          ),
                          Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  Icon(Icons.person),
                                  Text(
                                    data.partnerName,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Fonts.BonaNovaSC,
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: data.status == 0 ? true : false,
                                child: Row(
                                  spacing: 12,
                                  children: [
                                    CustomSvgIcon(image: Assets.iconsPhone),
                                    Text(
                                      data.partnerContact,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.BonaNovaSC,
                                      ),
                                    ),
                                  ],
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
              SizedBox(height: 15),
              Container(
                width: width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                    ),
                  ],
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
                          "Mode: ${data.paymentType}",
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
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Service Amount',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: Fonts.BonaNovaSC,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              data.amount.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Fonts.BonaNovaSC,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.currency_rupee, size: 18),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 6,
                          children: [
                            Text(
                              'Discount',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Fonts.BonaNovaSC,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Visibility(
                              visible: data.couponCode == "No Coupon Apply"
                                  ? false
                                  : true,
                              child: Text(
                                '(${data.couponCode})',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: Fonts.BonaNovaSC,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "- ${data.discountAmt.toString()}",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Fonts.BonaNovaSC,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.currency_rupee, size: 18),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'GST (5%)',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: Fonts.BonaNovaSC,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              data.gstAmt.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Fonts.BonaNovaSC,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.currency_rupee, size: 18),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Convenience Fees',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: Fonts.BonaNovaSC,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              data.fees.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Fonts.BonaNovaSC,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.currency_rupee, size: 18),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    DashedLine(),
                    SizedBox(height: 5),
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
                              data.totalAmount.toString(),
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
            ],
          ),
        ),
      ),
    );
  }
}
