import 'package:stroy_baza/src/api/api_provider.dart';
import 'package:stroy_baza/src/data_base/db_helper.dart';
import 'package:stroy_baza/src/data_base/district_base.dart';
import 'package:stroy_baza/src/data_base/order_base.dart';
import 'package:stroy_baza/src/data_base/region_base.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/model/order/order_model.dart';

class Repository {
  final ApiProvider _apiProvider = ApiProvider();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final DistrictBaseHelper _districtBaseHelper = DistrictBaseHelper();
  final RegionBaseHelper _regionBaseHelper = RegionBaseHelper();
  final OrderBaseHelper _orderBaseHelper = OrderBaseHelper();



  /// Data Base Bloc

  /// Order Base
  Future<int> saveOrderBase(OrderModel item) async => await _orderBaseHelper.saveOrder(item);
  Future<List<OrderModel>> getOrderBase() async => await _orderBaseHelper.getOrder();
  Future<void> clearOrderBase() async => await _orderBaseHelper.clear();



  Future<HttpResult> login(username, password) async => await _apiProvider.login(username, password);

  /// Paramets
  Future<HttpResult> category() async => await _apiProvider.category();
  Future<HttpResult> currency() async => await _apiProvider.currency();
  Future<HttpResult> paymentsType() async => await _apiProvider.paymentsType();

  /// Products
  Future<HttpResult> productList(int id) async => await _apiProvider.productList(id);
  Future<HttpResult> productDetail(id) async => await _apiProvider.productDetail(id);

  /// Clients
  Future<HttpResult> clientList() async => await _apiProvider.clientList();
  Future<HttpResult> clientDetail(id) async => await _apiProvider.clientDetail(id);
  Future<HttpResult> clientAdd(Map data) async => await _apiProvider.clientAdd(data);
  Future<HttpResult> clientUpdate(Map data,id) async => await _apiProvider.clientUpdate(data,id);
  Future<HttpResult> clientAgentAdd(Map data,id) async => await _apiProvider.clientAgentAdd(data,id);
  Future<HttpResult> clientAgentRemove(Map data,id) async => await _apiProvider.clientAgentRemove(data,id);

  /// Region
  Future<HttpResult> region() async => await _apiProvider.region();
  Future<HttpResult> regionDetail(id) async => await _apiProvider.regionDetail(id);

  /// District
  Future<HttpResult> district() async => await _apiProvider.district();
  Future<HttpResult> districtDetail(id) async => await _apiProvider.districtDetail(id);

  /// Order
  Future<HttpResult> orderList() async => await _apiProvider.orderList();
  Future<HttpResult> orderDetail(id) async => await _apiProvider.orderDetail(id);
  Future<HttpResult> orderDelete(id) async => await _apiProvider.orderDelete(id);

}
