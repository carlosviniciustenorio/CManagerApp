import 'dart:convert';

import 'package:dio/dio.dart';

import '../base/secure_storage_app.dart';
import 'package:http/http.dart' as http;

import '../models/anuncios_model.dart';

class HomeRepository {
  final dio = new Dio();

  Future<List<Anuncios>> getAnuncios() async {
    var accessToken = await getToken();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $accessToken"
    };
    final uri = "https://10.0.2.2:7110/api/anuncio/getAll";
    var response = await http.get(Uri.parse(uri), headers: headers);

    List<dynamic> jsonList = json.decode(response.body);
    List<Anuncios> anuncios =
        jsonList.map((json) => Anuncios.fromJson(json)).toList();

    return anuncios;
  }

  static Future<String?> getToken() async {
    var accessToken = await SecureStorageApp.Read("access_token");
    return accessToken;
  }
}
