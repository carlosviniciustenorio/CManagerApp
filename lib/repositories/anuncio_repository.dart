import 'dart:convert';

import 'package:dio/dio.dart';

import '../base/secure_storage_app.dart';
import 'package:http/http.dart' as http;

import '../models/anuncio_model.dart';
import '../models/anuncios_model.dart';

class AnuncioRepository {
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

  Future<Anuncio> getAnuncio(String id) async {
    var accessToken = await getToken();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $accessToken"
    };
    final uri = "https://10.0.2.2:7110/api/anuncio?id=${id}";
    var response = await http.get(Uri.parse(uri), headers: headers);

    dynamic jsonResponse = json.decode(response.body);
    Anuncio anuncio = Anuncio.fromJson(jsonResponse);

    return anuncio;
  }

  static Future<String?> getToken() async {
    var accessToken = await SecureStorageApp.Read("access_token");
    return accessToken;
  }
}
