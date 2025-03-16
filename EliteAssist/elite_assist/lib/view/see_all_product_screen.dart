import 'dart:math';

import 'package:elite_assist/model/product_model.dart';
import 'package:elite_assist/view/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_ui/custom_appbar.dart';
import '../generated/fonts.dart';

class SeeAllProductScreen extends StatelessWidget {
  ProductModel model;
  String appBarString;

  SeeAllProductScreen(
      {super.key, required this.model, required this.appBarString});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appBarString),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            mainAxisExtent: 210,
          ),
          itemCount: model.product.length,
          itemBuilder: (context, index) {
            var data = model.product[index];
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
                        data.productPic1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
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
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
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
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.star),
                          Text(
                            (4 + Random().nextDouble()).toStringAsFixed(2),
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
    );
  }
}
