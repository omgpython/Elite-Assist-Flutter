import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:elite_assist/controller/banner_controller.dart';
import 'package:elite_assist/controller/product_controller.dart';
import 'package:elite_assist/controller/service_controller.dart';
import 'package:elite_assist/generated/fonts.dart';
import 'package:elite_assist/view/product_detail_screen.dart';
import 'package:elite_assist/view/see_all_product_screen.dart';
import 'package:elite_assist/view/sub_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final bannerController = Get.put(BannerController());
  final serviceController = Get.put(ServiceController());
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    productController.getAllProduct();
    productController.getManProducts();
    productController.getWomanProducts();

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
        ),
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(fontFamily: Fonts.BebasNeue),
        ),
      ),
      body: Obx(
        () => bannerController.isLoading.value ||
                serviceController.isLoading.value ||
                productController.isAllProductLoading.value ||
                productController.isManProductsLoading.value ||
                productController.isWomanProductsLoading.value
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: .8,
                        autoPlayCurve: Curves.easeInOutBack,
                        onPageChanged: (index, reason) {
                          bannerController.currentIndex.value = index;
                        },
                      ),
                      items: bannerController.bannerModel!.banner.map(
                        (banner) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                banner.pic,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          bannerController.bannerModel!.banner.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            width: 30,
                            height: 5,
                            decoration: BoxDecoration(
                              color:
                                  bannerController.currentIndex.value == index
                                      ? Colors.black
                                      : Colors.grey,
                              borderRadius: index == 0
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    )
                                  : index ==
                                          bannerController
                                                  .bannerModel!.banner.length -
                                              1
                                      ? BorderRadius.only(
                                          topRight: Radius.circular(50),
                                          bottomRight: Radius.circular(50),
                                        )
                                      : BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      );
                    }),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.BonaNovaSC,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: serviceController.model!.service.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          mainAxisExtent: 130,
                        ),
                        itemBuilder: (context, index) {
                          var data = serviceController.model!.service[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => SubServiceScreen(
                                  id: data.id,
                                  name: data.sname,
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: Image.network(
                                        data.pic,
                                        width: double.infinity,
                                        height: 125,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                        top: 1,
                                      ),
                                      child: Text(
                                        data.sname,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: Fonts.Roboto,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.BonaNovaSC,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(
                                () => SeeAllProductScreen(
                                  model: productController.model!,
                                  appBarString: "Services",
                                ),
                              );
                            },
                            child: Text(
                              'See All >',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.BonaNovaSC,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          mainAxisExtent: 210,
                        ),
                        itemCount: productController.model!.product.length > 4
                            ? 4
                            : productController.model!.product.length,
                        itemBuilder: (context, index) {
                          var data = productController.model!.product[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => ProductDetailScreen(
                                  product: data,
                                  appBarString: data.productName,
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      width: double.infinity,
                                      height: 125,
                                      fit: BoxFit.cover,
                                      data.productPic1,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.room_service),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            data.productName,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Fonts.Roboto,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.currency_rupee),
                                        Text(
                                          data.price,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: Fonts.Roboto,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.star),
                                        Text(
                                          (4 + Random().nextDouble())
                                              .toStringAsFixed(2),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: Fonts.Roboto,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Man's Services",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.BonaNovaSC,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(
                                () => SeeAllProductScreen(
                                  model: productController.manModel!,
                                  appBarString: "Man's Services",
                                ),
                              );
                            },
                            child: Text(
                              'See All >',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.BonaNovaSC,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          mainAxisExtent: 210,
                        ),
                        itemCount:
                            productController.manModel!.product.length > 4
                                ? 4
                                : productController.manModel!.product.length,
                        itemBuilder: (context, index) {
                          var data = productController.manModel!.product[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => ProductDetailScreen(
                                  product: data,
                                  appBarString: data.productName,
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      width: double.infinity,
                                      height: 125,
                                      fit: BoxFit.cover,
                                      data.productPic1,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.room_service),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            data.productName,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Fonts.Roboto,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.currency_rupee),
                                        Text(
                                          data.price,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: Fonts.Roboto,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.star),
                                        Text(
                                          (4 + Random().nextDouble())
                                              .toStringAsFixed(2),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: Fonts.Roboto,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Woman's Services",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.BonaNovaSC,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(
                                () => SeeAllProductScreen(
                                  model: productController.womanModel!,
                                  appBarString: "Woman's Services",
                                ),
                              );
                            },
                            child: Text(
                              'See All >',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.BonaNovaSC,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          mainAxisExtent: 210,
                        ),
                        itemCount:
                            productController.womanModel!.product.length > 4
                                ? 4
                                : productController.womanModel!.product.length,
                        itemBuilder: (context, index) {
                          var data =
                              productController.womanModel!.product[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => ProductDetailScreen(
                                  product: data,
                                  appBarString: data.productName,
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      width: double.infinity,
                                      height: 125,
                                      fit: BoxFit.cover,
                                      data.productPic1,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.room_service),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            data.productName,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Fonts.Roboto,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.currency_rupee),
                                        Text(
                                          data.price,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: Fonts.Roboto,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.star),
                                        Text(
                                          (4 + Random().nextDouble())
                                              .toStringAsFixed(2),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: Fonts.Roboto,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          spacing: 12,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              spacing: 6,
                              children: [
                                Icon(Icons.handshake),
                                Container(
                                  width: screenWidth * 0.85,
                                  child: Text(
                                    'Connecting You to Quality Service, Anytime, Anywhere!',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Fonts.Roboto,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 6,
                              children: [
                                Icon(Icons.shield),
                                Container(
                                  width: screenWidth * 0.75,
                                  child: Text(
                                    'Your Trusted Partner for Seamless Service Solutions!',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Fonts.Roboto,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 6,
                              children: [
                                Icon(Icons.access_time),
                                Container(
                                  width: screenWidth * 0.75,
                                  child: Text(
                                    'Efficient Service at Your Fingertips!',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Fonts.Roboto,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 6,
                              children: [
                                Icon(Icons.check_circle),
                                Container(
                                  width: screenWidth * 0.75,
                                  child: Text(
                                    'Experience Excellence with Every Service!',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Fonts.Roboto,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
