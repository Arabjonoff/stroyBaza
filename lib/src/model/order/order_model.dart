class OrderModel {
  int id;
  num count;
  dynamic price;
  String name;
  String image;
  String priceType;

  OrderModel({
    required this.id,
    required this.count,
    required this.price,
    required this.image,
    required this.name,
    required this.priceType,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    count: json["count"],
    price: json["price"],
    image: json["image"],
    name: json["name"],
    priceType: json["priceType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "count": count,
    "price": price,
    "image": image,
    "name": name,
    "priceType": priceType,
  };
}