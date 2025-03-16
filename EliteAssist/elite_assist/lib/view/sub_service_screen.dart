import 'package:elite_assist/common_ui/custom_appbar.dart';
import 'package:elite_assist/controller/product_controller.dart';
import 'package:elite_assist/controller/sub_service_controller.dart';
import 'package:elite_assist/generated/fonts.dart';
import 'package:elite_assist/view/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubServiceScreen extends StatelessWidget {
  String id, name;

  SubServiceScreen({super.key, required this.id, required this.name});

  SubServiceController? subServiceController;
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    subServiceController ??= Get.put(SubServiceController(id: id));
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: name),
      body: Obx(
        () {
          if (subServiceController!.isLoading.value) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (subServiceController!.model!.service.isNotEmpty) {
            productController.getProduct(
                id: subServiceController!.model!
                    .service[subServiceController!.selectedIndex.value].id);
            return Row(
              children: [
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  width: width * 0.3,
                  child: ListView.separated(
                    itemCount: subServiceController!.model!.service.length,
                    itemBuilder: (context, index) {
                      var subCat = subServiceController!.model!.service[index];
                      return Obx(
                        () {
                          return GestureDetector(
                            onTap: () {
                              subServiceController!.selectedIndex.value = index;
                              productController.getProduct(id: subCat.id);
                            },
                            child: Container(
                              color:
                                  subServiceController!.selectedIndex.value ==
                                          index
                                      ? Colors.blue.shade400
                                      : Colors.white,
                              padding: EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      height: 100,
                                      width: double.infinity,
                                      subCat.ssPic,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    subCat.ssName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 1,
                  color: Colors.grey,
                ),
                Container(
                  width: width * 0.67,
                  child: Obx(() {
                    if (productController.isProductLoading.value) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (productController.model == null ||
                        productController.model!.product.isEmpty) {
                      return Center(
                        child: Text('Coming Soon!!'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: productController.model!.product.length,
                        itemBuilder: (context, index) {
                          var product = productController.model!.product[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => ProductDetailScreen(
                                  product: product,
                                  appBarString: subServiceController!
                                      .model!
                                      .service[subServiceController!
                                          .selectedIndex.value]
                                      .ssName,
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20,
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image.network(
                                      height: 120,
                                      width: double.infinity,
                                      product.productPic1,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          product.productName,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: Fonts.BonaNovaSC,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              size: 18,
                                            ),
                                            Text(
                                              product.price,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: Fonts.BonaNovaSC,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                'No Sub-Service Found!!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
