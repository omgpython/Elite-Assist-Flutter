import 'dart:developer';

import 'package:elite_assist/generated/const_data.dart';
import 'package:elite_assist/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxBool isProductLoading = false.obs;
  ProductModel? model;

  Future<void> getProduct({required String id}) async {
    try {
      isProductLoading.value = true;
      final url = Uri.parse(ConstantData.PRODUCT_API);
      var response = await http.post(url, body: {"id": id});
      if (response.statusCode == 200) {
        //log(response.body, name: "PRODUCT SERVER DATA");
        model = productModelFromJson(response.body);
        isProductLoading.value = false;
      }
    } catch (e) {
      log(e.toString(), name: "PRODUCT SERVER ERROR");
      isProductLoading.value = false;
    }
  }

  RxBool isRelatedLoading = false.obs;
  ProductModel? relatedModel;

  Future<void> getRelatedProduct({
    required String cat_id,
    required String prod_id,
  }) async {
    isRelatedLoading.value = true;
    try {
      final url = Uri.parse(ConstantData.GET_RELATED_PRODUCT_API);
      var response = await http.post(
        url,
        body: {
          "cat_id": cat_id,
          "prod_id": prod_id,
        },
      );
      if (response.statusCode == 200) {
        //log(response.body, name: "RELATED PRODUCT");
        relatedModel = productModelFromJson(response.body);
        isRelatedLoading.value = false;
      }
    } catch (e) {
      log(e.toString(), name: "RELATED PRODUCT ERROR");
      isRelatedLoading.value = false;
    }
  }

  RxBool isAllProductLoading = false.obs;

  Future<void> getAllProduct() async {
    isAllProductLoading.value = true;
    try {
      final url = Uri.parse(ConstantData.GET_ALL_PRODUCT_API);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        isAllProductLoading.value = false;
        model = productModelFromJson(response.body);
        //log(response.body, name: "ALL PRODUCT");
      }
    } catch (e) {
      isAllProductLoading.value = false;
      log(e.toString(), name: "ALL PRODUCT ERROR");
    }
  }

  RxBool isManProductsLoading = false.obs;
  ProductModel? manModel;

  Future<void> getManProducts() async {
    isManProductsLoading.value = true;
    try {
      final url = Uri.parse(ConstantData.GET_MAN_PRODUCT_API);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        isManProductsLoading.value = false;
        manModel = productModelFromJson(response.body);
        //log(response.body, name: "MAN PRODUCTS");
      }
    } catch (e) {
      isManProductsLoading.value = false;
      log(e.toString(), name: "MAN PRODUCT ERROR");
    }
  }

  RxBool isWomanProductsLoading = false.obs;
  ProductModel? womanModel;

  Future<void> getWomanProducts() async {
    isWomanProductsLoading.value = true;
    try {
      final url = Uri.parse(ConstantData.GET_WOMAN_PRODUCT_API);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        isWomanProductsLoading.value = false;
        womanModel = productModelFromJson(response.body);
        //log(response.body, name: "WOMAN PRODUCTS");
      }
    } catch (e) {
      isWomanProductsLoading.value = false;
      log(e.toString(), name: "WOMAN PRODUCT ERROR");
    }
  }
}
