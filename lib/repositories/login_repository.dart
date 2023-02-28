import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/user_model.dart';

class LoginRepository {
  final dio = Dio();
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  Future authenticate(User user) async {
    final uri = "https://10.0.2.2:7110/api/usuarios/login";
    final body = jsonEncode({'email': user.mailAdress, 'senha': user.password});

    var response =
        await dio.post(uri, options: Options(headers: headers), data: body);

    return response.data;
  }
}
