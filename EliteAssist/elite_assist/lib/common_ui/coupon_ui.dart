import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';

class CouponUI extends StatelessWidget {
  String couponCode, couponDiscount, couponDescription;

  CouponUI({
    Key? key,
    required this.couponCode,
    required this.couponDiscount,
    required this.couponDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xffe8cea8);
    const Color secondaryColor = Color(0xffe27c8c);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CouponCard(
        height: 150,
        backgroundColor: primaryColor,
        clockwise: true,
        curvePosition: 135,
        curveRadius: 30,
        curveAxis: Axis.vertical,
        borderRadius: 10,
        firstChild: Container(
          decoration: const BoxDecoration(
            color: secondaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$couponDiscount₹',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'OFF',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.white54, height: 0),
              Expanded(
                child: Center(
                  child: Text(
                    couponDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        secondChild: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Coupon Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 4),
              Text(
                couponCode,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                'Click To Copy Coupon Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
