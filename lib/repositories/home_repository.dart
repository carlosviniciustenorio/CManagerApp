import 'package:dio/dio.dart';

import '../base/secure_storage_app.dart';

class HomeRepository {
  final dio = new Dio();

  Future<Response<dynamic>> getAnuncios() async {
    var accessToken = await getToken();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $accessToken"
    };
    final uri = "https://10.0.2.2:7110/api/anuncio/getAll";
    var response = await dio.get(uri, options: Options(headers: headers));

    return response;
  }

  static Future<String?> getToken() async {
    var accessToken = await SecureStorageApp.Read("access_token");
    return accessToken;
  }
}
