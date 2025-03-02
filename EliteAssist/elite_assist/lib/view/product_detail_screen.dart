import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:elite_assist/common_ui/custom_svg_icon.dart';
import 'package:elite_assist/common_ui/dashed_line.dart';
import 'package:elite_assist/controller/product_controller.dart';
import 'package:elite_assist/generated/assets.dart';
import 'package:elite_assist/generated/fonts.dart';
import 'package:elite_assist/model/product_model.dart';
import 'package:elite_assist/view/service_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ProductDetailScreen extends StatelessWidget {
  Product product;
  String? appBarString;

  ProductDetailScreen({super.key, required this.product, this.appBarString});

  final controller = Get.put(ProductController());
  final vidController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    vidController.initializePlayer(product.productVid);
    controller.getRelatedProduct(
      cat_id: product.subServiceId,
      prod_id: product.id,
    );
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
        ),
        centerTitle: true,
        title: Text(
          appBarString ?? product.productName,
          style: TextStyle(
            fontFamily: Fonts.BebasNeue,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          autoPlayCurve: Curves.linear,
                          onPageChanged: (index, reason) {
                            controller.currentIndex.value = index;
                          },
                        ),
                        items: [product.productPic1, product.productPic2]
                            .map((img) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    img,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            2,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: controller.currentIndex.value == index
                                    ? Colors.black
                                    : Colors.grey,
                                borderRadius: index == 0
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        bottomLeft: Radius.circular(50),
                                      )
                                    : BorderRadius.only(
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                      ),
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
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
                            SizedBox(height: 5),
                            Row(
                              children: [
                                CustomSvgIcon(image: Assets.iconsService),
                                SizedBox(width: 5),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
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
                                CustomSvgIcon(image: Assets.iconsRupee),
                                SizedBox(width: 5),
                                Text(
                                  product.price,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Fonts.Roboto,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                CustomSvgIcon(image: Assets.iconsReview),
                                SizedBox(width: 5),
                                Text(
                                  (4 + Random().nextDouble())
                                      .toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Fonts.Roboto,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                CustomSvgIcon(image: Assets.iconsTimer),
                                SizedBox(width: 5),
                                Text(
                                  "Less Then ${product.time} Hour",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Fonts.Roboto,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Obx(() {
                          if (vidController.isInitialized.value) {
                            return AspectRatio(
                              aspectRatio: vidController
                                  .videoController.value.aspectRatio,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: VideoPlayer(
                                  vidController.videoController,
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                        }),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Service Description',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.BebasNeue,
                              ),
                            ),
                            SizedBox(height: 5),
                            DashedLine(),
                            SizedBox(height: 5),
                            Text(
                              product.details,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.Roboto,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Related Services',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.BebasNeue,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 20),
                          ],
                        ),
                        child: Obx(
                          () {
                            if (controller.isRelatedLoading.value) {
                              return Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            } else {
                              return ListView.builder(
                                itemCount:
                                    controller.relatedModel!.product.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var relatedProduct =
                                      controller.relatedModel!.product[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // Get.snackbar("title", "");
                                      // Get.to(
                                      //   () => ProductDetailScreen(
                                      //     product: relatedProduct,
                                      //     appBarString:
                                      //         relatedProduct.productName,
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Card(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          bottom: 15,
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                child: Image.network(
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  relatedProduct.productPic1,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      relatedProduct
                                                          .productName,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            Fonts.BonaNovaSC,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.currency_rupee,
                                                          size: 18,
                                                        ),
                                                        Text(
                                                          relatedProduct.price,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: Fonts
                                                                .BonaNovaSC,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Get.to(() => ServiceBookingScreen(product: product));
                },
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.black,
                ),
                child: Text('Book Now'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VideoController extends GetxController {
  late VideoPlayerController videoController;
  RxBool isInitialized = false.obs;

  void initializePlayer(String videoUrl) {
    videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        videoController.setLooping(true);
        videoController.play();
        isInitialized.value = true;
      }).catchError((error) {
        //print("Error initializing video: $error");
        isInitialized.value = false;
      });

    videoController.addListener(() {
      if (videoController.value.hasError) {
        //print('Video Player Error: ${videoController.value.errorDescription}');
      }
    });
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
