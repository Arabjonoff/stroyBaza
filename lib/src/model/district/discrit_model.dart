// To parse this JSON data, do
//
//     final discritModel = discritModelFromJson(jsonString);

import 'dart:convert';

DistrictModel discritModelFromJson(String str) => DistrictModel.fromJson(json.decode(str));

String discritModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
  bool success;
  List<DistrictResult> data;

  DistrictModel({
    required this.success,
    required this.data,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
    success: json["success"],
    data: List<DistrictResult>.from(json["data"].map((x) => DistrictResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DistrictResult {
  int id;
  String name;
  int clametor;
  bool isActive;
  int region;

  DistrictResult({
    required this.id,
    required this.name,
    required this.clametor,
    required this.isActive,
    required this.region,
  });

  factory DistrictResult.fromJson(Map<String, dynamic> json) => DistrictResult(
    id: json["id"]??0,
    name: json["name"]??"",
    clametor: json["clametor"]??0,
    isActive: json["is_active"]??true,
    region: json["region"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "clametor": clametor,
    "is_active": isActive,
    "region": region,
  };
}
