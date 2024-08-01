import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  bool status;
  List<Datum> data;

  CategoryModel({
    required this.status,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  dynamic img;

  Datum({
    required this.id,
    required this.name,
    required this.img,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]??0,
    name: json["name"]??"",
    img: json["img"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "img": img,
  };
}
