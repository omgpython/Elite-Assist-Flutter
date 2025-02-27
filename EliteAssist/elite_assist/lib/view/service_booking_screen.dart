import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:elite_assist/controller/address_controller.dart';
import 'package:elite_assist/controller/booking_controller.dart';
import 'package:elite_assist/generated/fonts.dart';
import 'package:elite_assist/model/product_model.dart';
import 'package:elite_assist/view/add_address_screen.dart';
import 'package:elite_assist/view/coupon_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:swipee/swipee.dart';

import '../common_ui/dashed_line.dart';

class ServiceBookingScreen extends StatelessWidget {
  Product product;
  bool i = false;

  final Razorpay _razorpay = Razorpay();

  ServiceBookingScreen({super.key, required this.product});

  final controller = Get.put(BookingController());
  final addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    init();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Service Booking',
          style: TextStyle(
            fontFamily: Fonts.BebasNeue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: screenWidth,
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
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.room_service_rounded),
                                  SizedBox(width: 5),
                                  Text(
                                    product.productName,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Fonts.BonaNovaSC,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.currency_rupee),
                                  //SvgPicture.asset(Assets.iconsRupee),
                                  SizedBox(width: 5),
                                  Obx(
                                    () => Text(
                                      controller.amount.value.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.Roboto,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            height: double.infinity,
                            width: double.infinity,
                            product.productPic1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth,
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
                        'Select Slots',
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
                            'Service Date :',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: Fonts.Roboto,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              controller.selectDate(context);
                            },
                            child: Obx(
                              () {
                                return Text(
                                  controller.date.value,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: Fonts.Roboto,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            'Service Time :',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: Fonts.Roboto,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              controller.selectTime(context);
                            },
                            child: Obx(
                              () {
                                return Text(
                                  controller.time.value,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: Fonts.Roboto,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth,
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
                            'Select Address',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.BebasNeue,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => AddAddressScreen());
                            },
                            child: Text(
                              '+ ADD',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.BebasNeue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      DashedLine(),
                      SizedBox(height: 15),
                      Obx(
                        () {
                          if (addressController.isAddressGet.value) {
                            return CircularProgressIndicator.adaptive();
                          } else {
                            return Container(
                              width: screenWidth * 0.9,
                              child: DropdownButton<String>(
                                hint: Text('No Address Available'),
                                isExpanded: true,
                                value:
                                    addressController.addressData.value.isEmpty
                                        ? null
                                        : addressController.addressData.value
                                            .toString(),
                                items: addressController.addressList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  addressController.addressData.value =
                                      newValue!;
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth,
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
                        'Payment Summary',
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
                              Obx(
                                () => Text(
                                  controller.amount.value.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: Fonts.BonaNovaSC,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                            'Discount',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: Fonts.BonaNovaSC,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Obx(
                                () => Text(
                                  "- ${controller.discount.value.toString()}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: Fonts.BonaNovaSC,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              Obx(
                                () => Text(
                                  controller.gst.value.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: Fonts.BonaNovaSC,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              Obx(
                                () => Text(
                                  controller.fees.value.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: Fonts.BonaNovaSC,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              Obx(
                                () => Text(
                                  controller.total_amount.value.toString(),
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: Fonts.BonaNovaSC,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                SizedBox(height: 20),
                Container(
                  width: screenWidth,
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
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: controller.couponController,
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) => controller.clearCoupon(),
                              focusNode: controller.focusNode,
                              onTapOutside: (event) {
                                controller.focusNode.unfocus();
                              },
                              decoration: InputDecoration(
                                labelText: 'Apply Coupon Code',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: FilledButton(
                              onPressed: () {
                                controller.focusNode.unfocus();
                                if (controller
                                    .couponController.text.isNotEmpty) {
                                  controller.applyCoupon();
                                } else {
                                  Get.snackbar(
                                    "Coupon Code Empty",
                                    "Please Add Your Code to Redeem Discount",
                                  );
                                }
                              },
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              child: Text('Apply'),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CouponScreen());
                        },
                        child: Text(
                          'View All Offers >',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: Fonts.BonaNovaSC,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth,
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
                        'Payment Type',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.BebasNeue,
                        ),
                      ),
                      SizedBox(height: 5),
                      DashedLine(),
                      SizedBox(height: 15),
                      CustomRadioButton(
                        unSelectedColor: Colors.white,
                        selectedColor: Colors.black,
                        defaultSelected: 'COD',
                        buttonLables: ['COD', 'ONLINE'],
                        buttonValues: ['COD', 'ONLINE'],
                        radioButtonValue: (value) {
                          controller.pay_type = value;
                        },
                        enableShape: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () {
                    if (controller.isAddLoading.value) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else {
                      return Swipee(
                        width: screenWidth,
                        buttonWidth: screenWidth * .3,
                        trackWidth: screenWidth,
                        trackChild: Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Text(
                            'Swipe To Confirm Booking',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.Roboto,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onSwipe: () {
                          if (controller.date.value == "Select Date") {
                            Get.snackbar("Date Required", "Please Select Date");
                          } else if (controller.time.value == "Select Time") {
                            Get.snackbar("Time Required", "Please Select Time");
                          } else if (addressController.addressData.value ==
                              '') {
                            Get.snackbar(
                              "Address Required",
                              "Please Select Address",
                            );
                          } else {
                            if (controller.total_amount >= 1) {
                              if (controller.pay_type == "COD") {
                                controller.addOrder(
                                  product: product,
                                  address: addressController.addressData.value,
                                );
                                Get.snackbar(
                                  "Service Booked",
                                  "Success! Your Appointment is All Set!",
                                );
                              } else if (controller.pay_type == "ONLINE") {
                                openCheckout();
                              }
                            } else {
                              controller.pay_type = "Nothing to Pay";
                              controller.addOrder(
                                product: product,
                                address: addressController.addressData.value,
                              );
                            }
                          }
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void init() {
    controller.amount.value = int.parse(product.price);
    controller.calculateAmount();
    addressController.getAddress();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    if (i) {
      return;
    }
    _razorpay.clear();
    controller.addOrder(
      product: product,
      address: addressController.addressData.toString(),
    );
    Get.snackbar("Payment Successful", "Your Service Booked");

    print("Payment Successful: ${response.paymentId}");
    i = true;
  }

// Error callback
  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Failed: ${response.message}");
    Get.snackbar("Payment Failed", "Please retry payment");
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_9OxKzClSORPlr4',
      'amount': controller.total_amount * 100,
      'name': 'Elite Assist',
      'prefill': {
        'contact': '9999999999',
        'email': 'test@razorpay.com',
      },
      'theme': {'color': '#000000'},
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }
}
