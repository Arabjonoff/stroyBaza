import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../model/http_result.dart';
import 'package:http/http.dart' as http;

class ApiProvider{
  final String _baseUrl = "https://naqshsoft.site/";
  static const _duration = Duration(seconds: 60);
  static Future<HttpResult> _patchRequest(String url, body,) async {
    print(url);
    print(body);
    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: {"Accept": "application/json",},
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
  static Future<HttpResult> _deleteRequest(String url, body,) async {
    print(url);
    print(body);
    try {
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: {"Accept": "application/json",},
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
  static Future<HttpResult> _postRequest(String url, body,) async {
    print(url);
    print(body);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Accept": "application/json",},
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
  static Future<HttpResult> _getRequest(String url,) async {
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url),).timeout(_duration);
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
  static HttpResult _result(http.Response response) {
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
}