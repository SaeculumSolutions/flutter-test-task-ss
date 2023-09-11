import 'dart:developer';

import 'package:dio/dio.dart';

class NetworkHandler {
  late Dio _dio;
  NetworkHandler() {
    _dio = Dio();
  }

  /// getMethod will call get APIs and provide response in form of Map<String,dyanmic>
  Future< dynamic> getMethod({
    required String url,
  }) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      }
      return [];
    } catch (err) {
      log("", name: "Get Error", error: err.toString());
      return [];
    }
  }
}
