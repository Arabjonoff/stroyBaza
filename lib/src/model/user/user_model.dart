// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int id;
  bool isStaff;
  String username;
  String firstName;
  String lastName;
  String phone;
  int typeNumber;
  String type;
  bool main;
  bool cash;
  bool warehouse;
  bool sale;
  bool retail;
  bool driver;
  bool master;
  bool agent;
  num totalSummaMaster;

  UserModel({
    required this.id,
    required this.isStaff,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.typeNumber,
    required this.type,
    required this.main,
    required this.cash,
    required this.warehouse,
    required this.sale,
    required this.retail,
    required this.driver,
    required this.master,
    required this.agent,
    required this.totalSummaMaster,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"]??0,
    isStaff: json["is_staff"],
    username: json["username"]??"",
    firstName: json["first_name"]??"",
    lastName: json["last_name"]??"",
    phone: json["phone"]??"",
    typeNumber: json["type_number"]??0,
    type: json["type"]??"",
    main: json["main"],
    cash: json["cash"],
    warehouse: json["warehouse"],
    sale: json["sale"],
    retail: json["retail"],
    driver: json["driver"],
    master: json["master"],
    agent: json["agent"],
    totalSummaMaster: json["total_summa_master"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_staff": isStaff,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "type_number": typeNumber,
    "type": type,
    "main": main,
    "cash": cash,
    "warehouse": warehouse,
    "sale": sale,
    "retail": retail,
    "driver": driver,
    "master": master,
    "agent": agent,
    "total_summa_master": totalSummaMaster,
  };
}
