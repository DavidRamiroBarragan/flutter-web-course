import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    _dio.options.baseUrl = 'http://localhost:8080/api';

    _dio.options.headers = {
      'x-token': LocalStorage.preferences.getString('token') ?? '',
    };
  }

  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error en el get');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final response = await _dio.post(path, data: formData);
      return response.data;
    } catch (e) {
      throw ('Error en el post');
    }
  }
}
