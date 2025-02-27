// To parse this JSON data, do
//
//     final personModel = personModelFromJson(jsonString);

import 'dart:convert';

PersonModel personModelFromJson(String str) =>
    PersonModel.fromJson(json.decode(str));

String personModelToJson(PersonModel data) => json.encode(data.toJson());

class PersonModel {
  bool status;
  String message;
  Person person;

  PersonModel({
    required this.status,
    required this.message,
    required this.person,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        status: json["status"],
        message: json["message"],
        person: Person.fromJson(json["person"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "person": person.toJson(),
      };
}

class Person {
  String username;
  String email;
  int phone;
  dynamic pic;
  dynamic fullname;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  Person({
    required this.username,
    required this.email,
    required this.phone,
    required this.pic,
    required this.fullname,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        pic: json["pic"],
        fullname: json["fullname"],
        password: json["password"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "pic": pic,
        "fullname": fullname,
        "password": password,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
      };
}
