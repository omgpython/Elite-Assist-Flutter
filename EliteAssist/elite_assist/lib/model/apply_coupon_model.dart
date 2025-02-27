import 'dart:convert';

ApplyCouponModel applyCouponModelFromJson(String str) =>
    ApplyCouponModel.fromJson(json.decode(str));

String applyCouponModelToJson(ApplyCouponModel data) =>
    json.encode(data.toJson());

class ApplyCouponModel {
  bool status;
  String message;
  Coupen coupen;

  ApplyCouponModel({
    required this.status,
    required this.message,
    required this.coupen,
  });

  factory ApplyCouponModel.fromJson(Map<String, dynamic> json) =>
      ApplyCouponModel(
        status: json["status"],
        message: json["message"],
        coupen: Coupen.fromJson(json["coupen"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "coupen": coupen.toJson(),
      };
}

class Coupen {
  String coupenCode;
  String coupenDescreption;
  String coupenDiscount;
  String coupenImg;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  Coupen({
    required this.coupenCode,
    required this.coupenDescreption,
    required this.coupenDiscount,
    required this.coupenImg,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory Coupen.fromJson(Map<String, dynamic> json) => Coupen(
        coupenCode: json["coupen_code"],
        coupenDescreption: json["coupen_descreption"],
        coupenDiscount: json["coupen_discount"],
        coupenImg: json["coupen_img"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "coupen_code": coupenCode,
        "coupen_descreption": coupenDescreption,
        "coupen_discount": coupenDiscount,
        "coupen_img": coupenImg,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
      };
}
