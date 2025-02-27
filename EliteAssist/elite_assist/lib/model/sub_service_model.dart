import 'dart:convert';

SubServiceModel subServiceModelFromJson(String str) =>
    SubServiceModel.fromJson(json.decode(str));

String subServiceModelToJson(SubServiceModel data) =>
    json.encode(data.toJson());

class SubServiceModel {
  bool status;
  String message;
  List<Service> service;

  SubServiceModel({
    required this.status,
    required this.message,
    required this.service,
  });

  factory SubServiceModel.fromJson(Map<String, dynamic> json) =>
      SubServiceModel(
        status: json["status"],
        message: json["message"],
        service:
            List<Service>.from(json["service"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "service": List<dynamic>.from(service.map((x) => x.toJson())),
      };
}

class Service {
  String ssPic;
  String ssName;
  String sid;
  DateTime updatedAt;
  DateTime createdAt;
  String id;

  Service({
    required this.ssPic,
    required this.ssName,
    required this.sid,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        ssPic: json["SsPic"],
        ssName: json["SsName"],
        sid: json["Sid"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "SsPic": ssPic,
        "SsName": ssName,
        "Sid": sid,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
