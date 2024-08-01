// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';

CategoryListModel categoryListModelFromJson(String str) => CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) => json.encode(data.toJson());

class CategoryListModel {
  int pages;
  List<Datum> data;

  CategoryListModel({
    required this.pages,
    required this.data,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
    pages: json["pages"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pages": pages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  Warehouse warehouse;
  Color color;
  String count;
  Product product;
  String companyName;
  String productNumber;
  dynamic img1;
  dynamic img2;
  dynamic img3;
  dynamic img4;
  dynamic img5;

  Datum({
    required this.id,
    required this.warehouse,
    required this.color,
    required this.count,
    required this.product,
    required this.companyName,
    required this.productNumber,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.img4,
    required this.img5,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    warehouse: Warehouse.fromJson(json["warehouse"]),
    color: Color.fromJson(json["color"]),
    count: json["count"],
    product: Product.fromJson(json["product"]),
    companyName: json["company_name"],
    productNumber: json["product_number"],
    img1: json["img_1"],
    img2: json["img_2"],
    img3: json["img_3"],
    img4: json["img_4"],
    img5: json["img_5"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "warehouse": warehouse.toJson(),
    "color": color.toJson(),
    "count": count,
    "product": product.toJson(),
    "company_name": companyName,
    "product_number": productNumber,
    "img_1": img1,
    "img_2": img2,
    "img_3": img3,
    "img_4": img4,
    "img_5": img5,
  };
}

class Color {
  int id;
  String name;

  Color({
    required this.id,
    required this.name,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Product {
  String name;
  List<Price> prices;
  Color measurement;
  Color size;

  Product({
    required this.name,
    required this.prices,
    required this.measurement,
    required this.size,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"]??"",
    prices: json["prices"]==null?[]:List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    measurement: json["measurement"]==null?Color.fromJson({}):Color.fromJson(json["measurement"]),
    size: json["size"]==null?Color.fromJson({}):Color.fromJson(json["size"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
    "measurement": measurement.toJson(),
    "size": size.toJson(),
  };
}

class Price {
  int id;
  String currency;
  String arrivalPrice;
  String unitPrice;
  String wholesalePrice;
  int product;

  Price({
    required this.id,
    required this.currency,
    required this.arrivalPrice,
    required this.unitPrice,
    required this.wholesalePrice,
    required this.product,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    id: json["id"]??0,
    currency: json["currency"]??"",
    arrivalPrice: json["arrival_price"]??"",
    unitPrice: json["unit_price"]??"",
    wholesalePrice: json["wholesale_price"]??"",
    product: json["product"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "currency": currency,
    "arrival_price": arrivalPrice,
    "unit_price": unitPrice,
    "wholesale_price": wholesalePrice,
    "product": product,
  };
}

class Warehouse {
  int id;
  String name;
  num income;
  num outcome;

  Warehouse({
    required this.id,
    required this.name,
    required this.income,
    required this.outcome,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
    id: json["id"]??0,
    name: json["name"]??"",
    income: json["income"]??0,
    outcome: json["outcome"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "income": income,
    "outcome": outcome,
  };
}
