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
  String password;
  String phone;
  DateTime updatedAt;
  DateTime createdAt;
  String id;

  Person({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
