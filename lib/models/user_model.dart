// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.uId,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.createdAt,
  });

  String? firstName;
  String? uId;
  String? lastName;
  String? email;
  String? password;
  String? createdAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uId: json["uId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "uId": uId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "createdAt": createdAt,
  };
}
