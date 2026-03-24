import 'package:dio/dio.dart';
import 'package:store_app/core/sensetive_data.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseUrl, headers: {"apiKey": apiKey}),
  );

  Future<Response> getData(String endPoint) async {
    return await _dio.get(endPoint);
  }

  Future<Response> postData(String endPoint, Map<String, dynamic> data) async {
    return await _dio.post(endPoint, data: data);
  }

  Future<Response> putData(String endPoint, Map<String, dynamic> data) async {
    return await _dio.patch(endPoint, data: data);
  }

  Future<Response> deleteData(String endPoint) async {
    return await _dio.delete(endPoint);
  }
}
