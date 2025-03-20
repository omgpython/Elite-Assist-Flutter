import 'package:action_slider/action_slider.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:elite_assist/common_ui/custom_appbar.dart';
import 'package:elite_assist/common_ui/custom_snackbar.dart';
import 'package:elite_assist/controller/address_controller.dart';
import 'package:elite_assist/controller/booking_controller.dart';
import 'package:elite_assist/generated/fonts.dart';
import 'package:elite_assist/model/product_model.dart';
import 'package:elite_assist/view/add_address_screen.dart';
import 'package:elite_assist/view/coupon_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../common_ui/dashed_line.dart';

class ServiceBookingScreen extends StatelessWidget {
  Product product;
  bool i = false;
  bool j = false;

  final Razorpay _razorpay = Razorpay();

  ServiceBookingScreen({super.key, required this.product});

  final bookingController = Get.put(BookingController());
  final addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    init();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    return Scaffold(
      appBar: CustomAppBar(title: '${product.productName} Booking'),
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
                                  Container(
                                    width: screenWidth * 0.3,
                                    child: Text(
                                      product.productName,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.BonaNovaSC,
                                      ),
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
                                      bookingController.amount.value.toString(),
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
                        spacing: 12,
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {
                                bookingController.selectDate(context);
                              },
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              child:
                                  Obx(() => Text(bookingController.date.value)),
                            ),
                          ),
                          Expanded(
                            child: FilledButton(
                              onPressed: () {
                                bookingController.selectTime(context);
                              },
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              child:
                                  Obx(() => Text(bookingController.time.value)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
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
                                  bookingController.amount.value.toString(),
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
                                  "- ${bookingController.discount.value.toString()}",
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
                                  bookingController.gst.value.toString(),
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
                                  bookingController.fees.value.toString(),
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
                                  bookingController.total_amount.value
                                      .toString(),
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
                              controller: bookingController.couponController,
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) =>
                                  bookingController.clearCoupon(),
                              focusNode: bookingController.focusNode,
                              onTapOutside: (event) {
                                bookingController.focusNode.unfocus();
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
                                bookingController.focusNode.unfocus();
                                if (bookingController
                                    .couponController.text.isNotEmpty) {
                                  bookingController.applyCoupon();
                                } else {
                                  CustomSnackBar(
                                    title: "Coupon Code Empty",
                                    message:
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
                          bookingController.pay_type = value;
                        },
                        enableShape: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () {
                    if (bookingController.isAddLoading.value) {
                      return ActionSlider.standard(
                        sliderBehavior: SliderBehavior.stretch,
                        width: screenWidth,
                        backgroundColor: Colors.white,
                        toggleColor: Colors.black,
                        action: (controller) async {
                          controller.loading();
                        },
                        child: const Text('Slide to confirm'),
                      );
                    } else {
                      return ActionSlider.standard(
                        sliderBehavior: SliderBehavior.stretch,
                        width: screenWidth,
                        backgroundColor: Colors.grey.shade100,
                        toggleColor: Colors.black,
                        successIcon: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                        ),
                        loadingIcon: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        action: (controller) async {
                          controller.loading();
                          if (bookingController.date.value == "Select Date") {
                            controller.reset();
                            CustomSnackBar(
                              title: "Date Required",
                              message: "Please Select Date",
                            );
                          } else if (bookingController.time.value ==
                              "Select Time") {
                            controller.reset();
                            CustomSnackBar(
                              title: "Time Required",
                              message: "Please Select Time",
                            );
                          } else if (addressController.addressData.value ==
                              '') {
                            controller.reset();
                            CustomSnackBar(
                              title: "Address Required",
                              message: "Please Select Address",
                            );
                          } else {
                            if (bookingController.total_amount >= 1) {
                              if (bookingController.pay_type == "COD") {
                                await Future.delayed(
                                  Duration(seconds: 2),
                                );
                                controller.success();
                                await Future.delayed(
                                  Duration(seconds: 1),
                                );
                                bookingController.addOrder(
                                  productId: product.id,
                                  address: addressController.addressData.value,
                                );
                                CustomSnackBar(
                                  title: "Service Booked",
                                  message:
                                      "Success! Your Appointment is All Set!",
                                );
                              } else if (bookingController.pay_type ==
                                  "ONLINE") {
                                await Future.delayed(
                                  const Duration(seconds: 2),
                                );
                                controller.success();
                                await Future.delayed(
                                  Duration(seconds: 1),
                                );
                                openCheckout();
                              }
                            } else {
                              bookingController.pay_type = "ONLINE";
                              await Future.delayed(
                                const Duration(seconds: 2),
                              );
                              controller.success();
                              await Future.delayed(
                                Duration(seconds: 1),
                              );
                              bookingController.addOrder(
                                productId: product.id,
                                address: addressController.addressData.value,
                              );
                            }

                            controller.success();
                            await Future.delayed(const Duration(seconds: 1));
                            controller.reset();
                          }
                        },
                        child: Text(
                          'Slide To Confirm',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: Fonts.BonaNovaSC,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

  Future<void> init() async {
    bookingController.amount.value = int.parse(product.price);
    bookingController.calculateAmount();
    addressController.getAddress();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    if (i) {
      return;
    }
    _razorpay.clear();
    bookingController.addOrder(
      productId: product.id,
      address: addressController.addressData.toString(),
    );
    CustomSnackBar(
      title: "Payment Successful",
      message: "Your Service Booked",
    );

    print("Payment Successful: ${response.paymentId}");
    i = true;
  }

// Error callback
  void _handlePaymentError(PaymentFailureResponse response) {
    if (!j) {
      j = true;
      print("Payment Failed: ${response.message}");
      CustomSnackBar(
        title: "Payment Failed",
        message: "Please retry payment",
      );
      Future.delayed(Duration(seconds: 5), () {
        j = false;
      });
    }
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_9OxKzClSORPlr4',
      'amount': bookingController.total_amount * 100,
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
