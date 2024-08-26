class OrderModel {
  int id;
  num count;
  dynamic price;
  String name;
  String image;
  String priceType;
  String currency;

  OrderModel({
    required this.id,
    required this.count,
    required this.price,
    required this.image,
    required this.name,
    required this.priceType,
    required this.currency,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    count: json["count"],
    price: json["price"],
    image: json["image"],
    name: json["name"],
    priceType: json["priceType"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "count": count,
    "price": price,
    "image": image,
    "name": name,
    "priceType": priceType,
    "currency": currency,
  };
}