import 'dart:convert';

PartnerModel partnerModelFromJson(String str) =>
    PartnerModel.fromJson(json.decode(str));

String partnerModelToJson(PartnerModel data) => json.encode(data.toJson());

class PartnerModel {
  bool status;
  String message;
  Partner partner;

  PartnerModel({
    required this.status,
    required this.message,
    required this.partner,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
    status: json["status"],
    message: json["message"],
    partner: Partner.fromJson(json["partner"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "partner": partner.toJson(),
  };
}

class Partner {
  String partnerPic;
  String aadharPic;
  String partnerName;
  String mobileNo;
  String emailId;
  String aadharNo;
  String productId;
  DateTime updatedAt;
  DateTime createdAt;
  String id;

  Partner({
    required this.partnerPic,
    required this.aadharPic,
    required this.partnerName,
    required this.mobileNo,
    required this.emailId,
    required this.aadharNo,
    required this.productId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
    partnerPic: json["partner_pic"],
    aadharPic: json["aadhar_pic"],
    partnerName: json["partner_name"],
    mobileNo: json["mobile_no"],
    emailId: json["email_id"],
    aadharNo: json["aadhar_no"],
    productId: json["product_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "partner_pic": partnerPic,
    "aadhar_pic": aadharPic,
    "partner_name": partnerName,
    "mobile_no": mobileNo,
    "email_id": emailId,
    "aadhar_no": aadharNo,
    "product_id": productId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
