import 'dart:convert';

ServiceModel serviceModelFromJson(String str) =>
    ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  bool status;
  String message;
  List<Service> service;

  ServiceModel({
    required this.status,
    required this.message,
    required this.service,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
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
  String sname;
  String pic;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  Service({
    required this.sname,
    required this.pic,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        sname: json["Sname"],
        pic: json["Pic"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Sname": sname,
        "Pic": pic,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
      };
}
