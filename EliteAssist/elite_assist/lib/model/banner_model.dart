import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  bool status;
  String message;
  List<Banner> banner;

  BannerModel({
    required this.status,
    required this.message,
    required this.banner,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        status: json["status"],
        message: json["message"],
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
      };
}

class Banner {
  String id;
  String btitle;
  String pic;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;

  Banner({
    required this.id,
    required this.btitle,
    required this.pic,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        btitle: json["btitle"],
        pic: json["pic"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "btitle": btitle,
        "pic": pic,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
