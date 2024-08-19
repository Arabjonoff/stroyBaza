import 'dart:convert';

ProductModel productsDetailModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productsDetailModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int pages;
  List<ProductResult> data;

  ProductModel({
    required this.pages,
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    pages: json["pages"],
    data: List<ProductResult>.from(json["data"].map((x) => ProductResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pages": pages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductResult {
  // Text("Optom: ${data.prices[index].wholesalePrice}",style: AppStyle.headLine4(AppColors.grey),),
  // Text("Oddiy: ${data.prices[index].unitPrice}",style: AppStyle.headLine4(AppColors.grey),),
  // Text("Qoldiq: ${data.productCounts[index].count}",style: AppStyle.headLine4(AppColors.grey),),
  int id;
  String name;
  String img,wholesalePrice,unitPrice,count;
  Category category;
  Measurement measurement;
  List<Price> prices;
  List<ProductCount> productCounts;

  ProductResult({
    required this.id,
    required this.name,
    required this.category,
    required this.measurement,
    required this.prices,
    required this.productCounts,
    this.img = '',
    this.wholesalePrice = '',
    this.unitPrice = '',
    this.count = '',
  });

  factory ProductResult.fromJson(Map<String, dynamic> json) => ProductResult(
    id: json["id"],
    name: json["name"],
    category: Category.fromJson(json["category"]),
    measurement: Measurement.fromJson(json["measurement"]),
    prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    productCounts: List<ProductCount>.from(json["product_counts"].map((x) => ProductCount.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category.toJson(),
    "measurement": measurement.toJson(),
    "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
    "product_counts": List<dynamic>.from(productCounts.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  dynamic img;

  Category({
    required this.id,
    required this.name,
    required this.img,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "img": img,
  };
}

class Measurement {
  int id;
  String name;

  Measurement({
    required this.id,
    required this.name,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    id: json["id"]??0,
    name: json["name"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
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
    id: json["id"],
    currency: json["currency"],
    arrivalPrice: json["arrival_price"],
    unitPrice: json["unit_price"],
    wholesalePrice: json["wholesale_price"],
    product: json["product"],
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

class ProductCount {
  int id;
  Warehouse warehouse;
  Measurement color;
  Measurement size;
  Product product;
  String count;
  String companyName;
  String productNumber;
  String img1;
  dynamic img2;
  String? img3;
  dynamic img4;
  dynamic img5;

  ProductCount({
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

  factory ProductCount.fromJson(Map<String, dynamic> json) => ProductCount(
    id: json["id"],
    warehouse: Warehouse.fromJson(json["warehouse"]),
    color: json["color"]==null?Measurement.fromJson({}):Measurement.fromJson(json["color"]),
    size: json["size"]==null?Measurement.fromJson({}):Measurement.fromJson(json["size"]),
    product: Product.fromJson(json["product"]),
    count: json["count"],
    companyName: json["company_name"],
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

class Product {
  String name;
  List<Price> prices;
  Measurement measurement;

  Product({
    required this.name,
    required this.prices,
    required this.measurement,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    measurement: Measurement.fromJson(json["measurement"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
    "measurement": measurement.toJson(),
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
    id: json["id"],
    name: json["name"],
    income: json["income"],
    outcome: json["outcome"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "income": income,
    "outcome": outcome,
  };
}
