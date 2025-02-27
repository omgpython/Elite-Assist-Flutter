// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  bool status;
  String msg;
  List<Address> address;

  AddressModel({
    required this.status,
    required this.msg,
    required this.address,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        status: json["status"],
        msg: json["msg"],
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
      };
}

class Address {
  String houseno;
  String street;
  String landmark;
  String area;
  String city;
  String state;
  String pincode;
  String type;
  String uid;
  DateTime updatedAt;
  DateTime createdAt;
  String id;

  Address({
    required this.houseno,
    required this.street,
    required this.landmark,
    required this.area,
    required this.city,
    required this.state,
    required this.pincode,
    required this.type,
    required this.uid,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        houseno: json["houseno"],
        street: json["street"],
        landmark: json["landmark"],
        area: json["area"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        type: json["type"],
        uid: json["uid"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "houseno": houseno,
        "street": street,
        "landmark": landmark,
        "area": area,
        "city": city,
        "state": state,
        "pincode": pincode,
        "type": type,
        "uid": uid,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
