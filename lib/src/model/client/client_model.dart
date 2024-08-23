
import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  bool success;
  List<ClientResult> data;

  ClientModel({
    required this.success,
    required this.data,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
    success: json["success"],
    data: List<ClientResult>.from(json["data"].map((x) => ClientResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ClientResult {
  int id;
  int district;
  String fio;
  int type;
  String phone;
  String telegramId;
  String address;
  dynamic latitude;
  dynamic longitude;
  num uzsAcc;
  num usdAcc;
  num uzsStart;
  num usdStart;
  num uzsSum;
  num usdSum;

  ClientResult({
    required this.id,
    required this.district,
    required this.fio,
    required this.type,
    required this.phone,
    required this.telegramId,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.uzsAcc,
    required this.usdAcc,
    required this.uzsStart,
    required this.usdStart,
    required this.uzsSum,
    required this.usdSum,
  });

  factory ClientResult.fromJson(Map<String, dynamic> json) => ClientResult(
    id: json["id"]??0,
    district: json["district"]??0,
    fio: json["fio"]??"",
    type: json["type"]??0,
    phone: json["phone"]??"",
    telegramId: json["telegram_id"]??"",
    address: json["address"]??"",
    latitude: json["latitude"],
    longitude: json["longitude"],
    uzsAcc: json["uzs_acc"]??0,
    usdAcc: json["usd_acc"]??0,
    uzsStart: json["uzs_start"]??0,
    usdStart: json["usd_start"]??0,
    uzsSum: json["uzs_sum"]??0,
    usdSum: json["usd_sum"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "district": district,
    "fio": fio,
    "type": type,
    "phone": phone,
    "telegram_id": telegramId,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "uzs_acc": uzsAcc,
    "usd_acc": usdAcc,
    "uzs_start": uzsStart,
    "usd_start": usdStart,
    "uzs_sum": uzsSum,
    "usd_sum": usdSum,
  };
}
