import 'package:stroy_baza/src/api/api_provider.dart';
import 'package:stroy_baza/src/model/http_result.dart';

class Repository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<HttpResult> login(username, password) async => await _apiProvider.login(username, password);

  /// Paramets
  Future<HttpResult> category() async => await _apiProvider.category();
  Future<HttpResult> currency() async => await _apiProvider.currency();
  Future<HttpResult> paymentsType() async => await _apiProvider.paymentsType();

  /// Products
  Future<HttpResult> productList() async => await _apiProvider.productList();
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
