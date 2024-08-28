import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stroy_baza/src/utils/cache.dart';

import '../model/http_result.dart';
import 'package:http/http.dart' as http;

class ApiProvider{
  final String _baseUrl = "http://185.237.165.236/";
  static const _duration = Duration(seconds: 60);
  getReqHeader() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")??"";
    if (token == "") {
      return {
        "Accept": "application/json",
      };
    } else {
      return {
      "Accept": "application/json; charset=utf-8",
      "Content-Type": "application/json;odata=verbose;charset=utf-8",
      'Authorization': 'Token $token',
      };
    }
  }
   Future<HttpResult> _patchRequest(String url, body,) async {
    print(url);
    print(body);
    try {
      final dynamic headers = await getReqHeader();
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: body,
      ).timeout(_duration);
      return _result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    }
  }
   Future<HttpResult> _putRequest(String url, body,) async {
    // print(url);
    // print(body);
    try {
      final dynamic headers = await getReqHeader();
      http.Response response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: body,
      ).timeout(_duration);
      return _result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    }
  }
   Future<HttpResult> _deleteRequest(String url, body,) async {
    print(url);
    print(body);
    try {
      final dynamic headers = await getReqHeader();
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: {
          "Accept": "application/json; charset=utf-8",
          'Authorization': 'Token ${CacheService.getUserToken()}',
        },
        body: body,
      ).timeout(_duration);
      return _result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    }
  }
   Future<HttpResult> _postRequest(String url, body,) async {
    print(url);
    print(body);
    try {
      final dynamic headers = await getReqHeader();
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      ).timeout(_duration);
      return _result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    }
  }
   Future<HttpResult> _getRequest(String url,) async {
    print(url);
    try {
      final dynamic headers = await getReqHeader();
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers
      ).timeout(_duration);
      return _result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        result: "",
        statusCode: -1,
      );
    }
  }
   HttpResult _result(http.Response response) {
    print(response.statusCode);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    } else {
      try {
        var info = json.decode(
          response.body,
        );
        return HttpResult(
          isSuccess: false,
          statusCode: response.statusCode,
          result: info,
        );
      } catch (_) {
        return HttpResult(
          isSuccess: false,
          statusCode: response.statusCode,
          result: response.body,
        );
      }
    }
  }

  Future<HttpResult> login(String username,password)async{
    Map body = {
      "username":username,
      "password":password
    };
    String url = "${_baseUrl}app/login/";
    return await _postRequest(url, body);
  }

  /// Parametors
  Future<HttpResult> category()async{
    String url = "${_baseUrl}app/category/";
    return await _getRequest(url,);
  }
  Future<HttpResult> currency()async{
    String url = "${_baseUrl}app/currency/";
    return await _getRequest(url,);
  }
  Future<HttpResult> paymentsType()async{
    String url = "${_baseUrl}app/payment-tayps//";
    return await _getRequest(url,);
  }

  /// Products
  Future<HttpResult> productList(int id)async{
    String url = "${_baseUrl}app/products/?category=$id";
    return await _getRequest(url,);
  }
  Future<HttpResult> productDetail(id)async{
    String url = "${_baseUrl}app/products/$id/";
    return await _getRequest(url,);
  }

  /// Clients
  Future<HttpResult> clientList()async{
    String url = "${_baseUrl}app/clients/";
    return await _getRequest(url,);
  }
  Future<HttpResult> clientAdd(Map data)async{
    String url = "${_baseUrl}app/clients/";
    return await _postRequest(url, json.encode(data));
  }
  Future<HttpResult> clientDetail(id)async{
    String url = "${_baseUrl}app/clients/$id/";
    return await _getRequest(url,);
  }
  Future<HttpResult> clientUpdate(Map data,id)async{
    String url = "${_baseUrl}app/clients/$id/";
    return await _putRequest(url, data);
  }
  Future<HttpResult> clientAgentAdd(Map data,id)async{
    String url = "${_baseUrl}app/1/client_agent_add/";
    return await _putRequest(url, data);
  }
  Future<HttpResult> clientAgentRemove(Map data,id)async{
    String url = "${_baseUrl}app/1/client_agent_remove/";
    return await _putRequest(url, data);
  }

  /// Region
  Future<HttpResult> region()async{
    String url = "${_baseUrl}app/regyons/";
    return await _getRequest(url,);
  }
  Future<HttpResult> regionDetail(int id)async{
    String url = "${_baseUrl}app/regyons/$id/";
    return await _getRequest(url,);
  }

  /// District
  Future<HttpResult> district()async{
    String url = "${_baseUrl}app/districts/";
    return await _getRequest(url,);
  }
  Future<HttpResult> districtDetail(int id)async{
    String url = "${_baseUrl}app/districts/$id/";
    return await _getRequest(url,);
  }

  /// Order
  Future<HttpResult> orderList()async{
    String url = "${_baseUrl}app/orders/";
    return await _getRequest(url,);
  }
  Future<HttpResult> orderDetail(id)async{
    String url = "${_baseUrl}app/orders/$id/";
    return await _getRequest(url,);
  }
  Future<HttpResult> orderDelete(id)async{
    String url = "${_baseUrl}app/orders/$id/";
    return await _deleteRequest(url,{});
  }
  Future<HttpResult> orderAdd(data)async{
    String url = "${_baseUrl}app/orders/";
    return await _postRequest(url,json.encode(data));
  }
  Future<HttpResult> orderUpdate(data,id)async{
    String url = "${_baseUrl}app/orders/$id/";
    return await _patchRequest(url,json.encode(data));
  }

}