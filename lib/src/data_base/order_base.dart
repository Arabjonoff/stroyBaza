import 'package:sqflite/sqflite.dart';
import 'package:stroy_baza/src/data_base/db_helper.dart';
import 'package:stroy_baza/src/model/order/order_model.dart';

class OrderBaseHelper {
  OrderBaseHelper? orderBaseHelper;
  final DatabaseHelper _dbProvider = DatabaseHelper.instance;

  Future<int> saveOrder(OrderModel item) async {
    var dbClient = await _dbProvider.db;
    var res = dbClient.insert('orders', item.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
    return await res;
  }

  Future<int> updateOrder(OrderModel item) async {
    var dbClient = await _dbProvider.db;
    var res = dbClient.update('orders', item.toJson(),where: 'id=?',whereArgs: [item.id]);
    return await res;
  }


  Future<List<OrderModel>> getOrder() async {
    var dbClient = await _dbProvider.db;
    List<OrderModel> data = <OrderModel>[];
    List<Map> list =
        await dbClient.rawQuery("SELECT * FROM orders ORDER BY id DESC");
    for (int i = 0; i < list.length; i++) {
      OrderModel orderModel = OrderModel(
        id: list[i]["id"],
        count: list[i]["count"],
        price: list[i]["price"],
        image: list[i]["image"],
        name: list[i]["name"],
        priceType: list[i]["priceType"],
      );
      data.add(orderModel);
    }
    return data;
  }

  Future<int> deleteOrder(id) async {
    var dbClient = await _dbProvider.db;
    var res = dbClient.delete('orders',where: 'id=?',whereArgs: [id]);
    return await res;
  }


  Future<void> clear()async{
    var dbClient = await _dbProvider.db;
    await dbClient.rawQuery("DELETE FROM orders");
  }
}
