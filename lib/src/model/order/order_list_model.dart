// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  bool success;
  Data data;

  OrderListModel({
    required this.success,
    required this.data,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  int pages;
  List<OrderResult> data;

  Data({
    required this.pages,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pages: json["pages"],
    data: List<OrderResult>.from(json["data"].map((x) => OrderResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pages": pages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class OrderResult {
  int id;
  String client;
  String seller;
  dynamic sender;
  dynamic master;
  String cource;
  int status;
  String getStatusDisplay;
  List<Item> items;
  String createdDate;
  String orderId;
  dynamic finishedDate;
  dynamic returnedDate;
  int totalSummaUzs;
  int totalSummaUsd;
  String clientBeforeUzs;
  String clientBeforeUsd;
  String clientAfterUzs;
  String clientAfterUsd;
  String discountUzs;
  String discountUsd;
  dynamic comment;

  OrderResult({
    required this.id,
    required this.client,
    required this.seller,
    required this.sender,
    required this.master,
    required this.cource,
    required this.status,
    required this.getStatusDisplay,
    required this.items,
    required this.createdDate,
    required this.orderId,
    required this.finishedDate,
    required this.returnedDate,
    required this.totalSummaUzs,
    required this.totalSummaUsd,
    required this.clientBeforeUzs,
    required this.clientBeforeUsd,
    required this.clientAfterUzs,
    required this.clientAfterUsd,
    required this.discountUzs,
    required this.discountUsd,
    required this.comment,
  });

  factory OrderResult.fromJson(Map<String, dynamic> json) => OrderResult(
    id: json["id"]??0,
    client: json["client"]??"",
    seller: json["seller"]??"",
    sender: json["sender"]??"",
    master: json["master"]??"",
    cource: json["cource"]??"",
    status: json["status"]??1,
    getStatusDisplay: json["get_status_display"]??"",
    items: json["items"]==null?[]:List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    createdDate: json["created_date"]??"",
    orderId: json["order_id"]??"",
    finishedDate: json["finished_date"]??"",
    returnedDate: json["returned_date"]??"",
    totalSummaUzs: json["total_summa_uzs"]??"",
    totalSummaUsd: json["total_summa_usd"]??"",
    clientBeforeUzs: json["client_before_uzs"]??"",
    clientBeforeUsd: json["client_before_usd"]??"",
    clientAfterUzs: json["client_after_uzs"]??"",
    clientAfterUsd: json["client_after_usd"]??"",
    discountUzs: json["discount_uzs"]??"",
    discountUsd: json["discount_usd"]??"",
    comment: json["comment"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "client": client,
    "seller": seller,
    "sender": sender,
    "master": master,
    "cource": cource,
    "status": status,
    "get_status_display": getStatusDisplay,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "created_date": createdDate,
    "order_id": orderId,
    "finished_date": finishedDate,
    "returned_date": returnedDate,
    "total_summa_uzs": totalSummaUzs,
    "total_summa_usd": totalSummaUsd,
    "client_before_uzs": clientBeforeUzs,
    "client_before_usd": clientBeforeUsd,
    "client_after_uzs": clientAfterUzs,
    "client_after_usd": clientAfterUsd,
    "discount_uzs": discountUzs,
    "discount_usd": discountUsd,
    "comment": comment,
  };
}

class Item {
  int id;
  ItemProduct product;
  String count;
  String price;
  String currency;
  int totalPrice;

  Item({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
    required this.currency,
    required this.totalPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    product: ItemProduct.fromJson(json["product"]),
    count: json["count"],
    price: json["price"],
    currency: json["currency"],
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product.toJson(),
    "count": count,
    "price": price,
    "currency": currency,
    "total_price": totalPrice,
  };
}

class ItemProduct {
  int id;
  Warehouse warehouse;
  Color color;
  Color size;
  ProductProduct product;
  String count;
  String? companyName;
  String? productNumber;
  String img1;
  String img2;
  String img3;
  String img4;
  String img5;

  ItemProduct({
    required this.id,
    required this.warehouse,
    required this.color,
    required this.size,
    required this.product,
    required this.count,
    required this.companyName,
    required this.productNumber,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.img4,
    required this.img5,
  });

  factory ItemProduct.fromJson(Map<String, dynamic> json) => ItemProduct(
    id: json["id"],
    warehouse: json["warehouse"]==null?Warehouse.fromJson({}):Warehouse.fromJson(json["warehouse"]),
    color: json["color"]==null?Color.fromJson({}):Color.fromJson(json["color"]),
    size: json["size"]==null?Color.fromJson({}):Color.fromJson(json["size"]),
    product: json["product"]==null?ProductProduct.fromJson({}):ProductProduct.fromJson(json["product"]),
    count: json["count"]??"",
    companyName: json["company_name"]??"",
    productNumber: json["product_number"],
    img1: json["img_1"]??"",
    img2: json["img_2"]??"",
    img3: json["img_3"]??"",
    img4: json["img_4"]??"",
    img5: json["img_5"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "warehouse": warehouse.toJson(),
    "color": color.toJson(),
    "size": size.toJson(),
    "product": product.toJson(),
    "count": count,
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

class ProductProduct {
  String name;
  List<Price> prices;
  Color measurement;

  ProductProduct({
    required this.name,
    required this.prices,
    required this.measurement,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
    name: json["name"],
    prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    measurement: Color.fromJson(json["measurement"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
    "measurement": measurement.toJson(),
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
    product: json["product"]??"",
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
  int income;
  int outcome;

  Warehouse({
    required this.id,
    required this.name,
    required this.income,
    required this.outcome,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
    id: json["id"]??0,
    name: json["name"]??"",
    income: json["income"]??"",
    outcome: json["outcome"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "income": income,
    "outcome": outcome,
  };
}
