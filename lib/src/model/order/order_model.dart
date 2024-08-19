class OrderModel {
  int id;
  int count;
  int price;
  String name;
  String image;

  OrderModel({
    required this.id,
    required this.count,
    required this.price,
    required this.image,
    required this.name,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    count: json["count"],
    price: json["price"],
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "count": count,
    "price": price,
    "image": image,
    "name": name,
  };
}