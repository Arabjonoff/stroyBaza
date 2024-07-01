import 'package:shared_preferences/shared_preferences.dart';

class CacheService{

  static SharedPreferences? preferences;
  static init() async {
    preferences = await SharedPreferences.getInstance();
  }
  static Future<bool> clear() async {
    return await preferences!.clear();
  }



}