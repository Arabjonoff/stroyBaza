import 'package:stroy_baza/src/data_base/db_helper.dart';

class OrderBaseHelper {
  OrderBaseHelper? orderBaseHelper;
  final DatabaseHelper _dbProvider = DatabaseHelper.instance;

  Future<int>saveOrder(item) async {
    var dbClient = await _dbProvider.db;
    var res = dbClient.insert('order', item);
    return res;
  }
}