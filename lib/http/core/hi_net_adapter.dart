import 'dart:convert';

import 'package:bilibili/http/request/base_request.dart';

/// 网络请求抽象类
abstract class HiNetAdapter {
  Future<HiNetResponse<T>> send<T>(BaseRequest request);
}

/// 统一网络层返回格式
class HiNetResponse<T> {
  HiNetResponse(
      {this.data,
      this.request,
      this.statusCode,
      this.statusMessage,
      this.extra});

  T data;

  /// 请求
  BaseRequest request;

  /// http状态码
  int statusCode;

  /// message
  String statusMessage;

  dynamic extra;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
