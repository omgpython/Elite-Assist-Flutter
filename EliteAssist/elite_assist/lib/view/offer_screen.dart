import 'package:elite_assist/common_ui/coupon_ui.dart';
import 'package:elite_assist/common_ui/custom_appbar.dart';
import 'package:elite_assist/common_ui/custom_snackbar.dart';
import 'package:elite_assist/controller/coupon_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OfferScreen extends StatelessWidget {
  OfferScreen({super.key});

  final controller = Get.put(CouponController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Offer Zone'),
      body: RefreshIndicator(
        onRefresh: controller.getCoupon,
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (controller.model == null || controller.model!.coupen.isEmpty) {
            Center(
              child: Text('No Offer Available'),
            );
          }

          return ListView.builder(
            itemCount: controller.model!.coupen.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
                await Clipboard.setData(
                  ClipboardData(
                      text: controller.model!.coupen[index].coupenCode),
                );
                CustomSnackBar(title: "Copied", message: "Coupon Code Copied");
              },
              child: CouponUI(
                couponCode: controller.model!.coupen[index].coupenCode,
                couponDiscount: controller.model!.coupen[index].coupenDiscount,
                couponDescription:
                    controller.model!.coupen[index].coupenDescreption,
              ),
            ),
          );
        }),
      ),
    );
  }
}
