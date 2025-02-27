import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool status;
  String message;
  List<Product> product;

  ProductModel({
    required this.status,
    required this.message,
    required this.product,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  String productPic1;
  String productPic2;
  String productVid;
  String productName;
  String price;
  String details;
  String time;
  String gender;
  String subServiceId;
  DateTime updatedAt;
  DateTime createdAt;
  String id;

  Product({
    required this.productPic1,
    required this.productPic2,
    required this.productVid,
    required this.productName,
    required this.price,
    required this.details,
    required this.time,
    required this.gender,
    required this.subServiceId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productPic1: json["product_pic1"],
        productPic2: json["product_pic2"],
        productVid: json["product_vid"],
        productName: json["product_name"],
        price: json["price"],
        details: json["details"],
        time: json["time"],
        gender: json["gender"],
        subServiceId: json["SubService_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "product_pic1": productPic1,
        "product_pic2": productPic2,
        "product_vid": productVid,
        "product_name": productName,
        "price": price,
        "details": details,
        "time": time,
        "gender": gender,
        "SubService_id": subServiceId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
