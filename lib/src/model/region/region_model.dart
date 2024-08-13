import 'dart:convert';

RegionModel regionModelFromJson(String str) => RegionModel.fromJson(json.decode(str));

String regionModelToJson(RegionModel data) => json.encode(data.toJson());

class RegionModel {
  bool success;
  List<RegionResult> data;

  RegionModel({
    required this.success,
    required this.data,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    success: json["success"],
    data: List<RegionResult>.from(json["data"].map((x) => RegionResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class RegionResult {
  int id;
  String name;
  bool isActive;

  RegionResult({
    required this.id,
    required this.name,
    required this.isActive,
  });

  factory RegionResult.fromJson(Map<String, dynamic> json) => RegionResult(
    id: json["id"]??0,
    name: json["name"]??"",
    isActive: json["is_active"]??true,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_active": isActive,
  };
}
