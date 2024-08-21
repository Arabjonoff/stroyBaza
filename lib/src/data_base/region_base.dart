import 'package:sqflite/sqflite.dart';
import 'package:stroy_baza/src/data_base/db_helper.dart';
import 'package:stroy_baza/src/model/region/region_model.dart';

class RegionBaseHelper {
  RegionBaseHelper? regionBaseHelper;
  DatabaseHelper dbProvider = DatabaseHelper.instance;

  Future<int> saveRegion(RegionResult item) async {
    var dbClient = await dbProvider.db;
    var res = dbClient.insert('region', item.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
    print(await res);
    return res;
  }

  Future<List<RegionResult>> getRegion()async{
    var dbClient = await dbProvider.db;
    List<RegionResult> data = <RegionResult>[];
    List<Map> list = await dbClient.rawQuery("SELECT * FROM region ORDER BY id DESC");
    for(int i = 0; i<list.length;i++){
      RegionResult regionResult = RegionResult(
          id: list[i]['id'],
          name: list[i]['name'],
          isActive: list[i]['is_active']
      );
      data.add(regionResult);
    }
    return data;
  }
  Future<void> clear()async{
    var dbClient = await dbProvider.db;
    await dbClient.rawQuery("DELETE FROM region");
  }

}
