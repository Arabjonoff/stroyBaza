import 'package:sqflite/sqflite.dart';
import 'package:stroy_baza/src/data_base/db_helper.dart';
import 'package:stroy_baza/src/model/district/discrit_model.dart';

class DistrictBaseHelper {
  DistrictBaseHelper? districtBaseHelper;
  DatabaseHelper dbProvider = DatabaseHelper.instance;

  Future<int> saveDistrict(DistrictResult item) async {
    var dbClient = await dbProvider.db;
    var res = dbClient.insert('district', item.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
    print(await res);
    return res;
  }

  Future<List<DistrictResult>> getDistrict(obj)async{
    var dbClient = await dbProvider.db;
    List<DistrictResult> data = <DistrictResult>[];
    List<Map> list = await dbClient.rawQuery("SELECT * FROM district  WHERE region LIKE '%$obj%'");
    for(int i=0; i<list.length;i++){
      DistrictResult districtResult = DistrictResult(
          id: list[i]['id'],
          name: list[i]['name'],
          clametor: list[i]['clametor'],
          isActive: list[i]['isActive'],
          region: list[i]['region']);
      data.add(districtResult);
    }
    return data;
  }
  Future<void> clear()async{
    var dbClient = await dbProvider.db;
    await dbClient.rawQuery("DELETE FROM district");
  }
}