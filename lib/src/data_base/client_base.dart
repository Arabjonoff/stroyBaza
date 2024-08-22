import 'package:sqflite/sqflite.dart';
import 'package:stroy_baza/src/data_base/db_helper.dart';
import 'package:stroy_baza/src/model/client/client_model.dart';

class ClientBaseHelper {
  ClientBaseHelper? clientBaseHelper;
  final DatabaseHelper dbProvider = DatabaseHelper.instance;

  Future<int> saveClient(ClientResult item) async {
    var dbClient = await dbProvider.db;
    var res = dbClient.insert('clients', item.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
    print(await res);
    return res;
  }

  Future<List<ClientResult>> getClient(obj) async {
    var dbClient = await dbProvider.db;
    List<ClientResult> data = <ClientResult>[];
    List<Map> list = await dbClient
        .rawQuery("SELECT * FROM clients  WHERE fio LIKE '%$obj%'");
    for (int i = 0; i < list.length; i++) {
      ClientResult clientResult = ClientResult(
        id: list[i]["id"],
        district: list[i]["district"],
        fio: list[i]["fio"],
        type: list[i]["type"],
        phone: list[i]["phone"],
        telegramId: list[i]["telegram_id"],
        address: list[i]["address"],
        latitude: list[i]["latitude"],
        longitude: list[i]["longitude"],
        uzsAcc: 0,
        usdAcc: 0,
        uzsStart: 0,
        usdStart: 0,
        uzsSum: 0,
        usdSum: 0,
      );
      data.add(clientResult);
    }
    return data;
  }

  Future<void> clear() async {
    var dbClient = await dbProvider.db;
    await dbClient.rawQuery("DELETE FROM clients");
  }
}
