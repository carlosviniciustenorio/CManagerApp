import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginController {
  Future<bool> loginUser(String mailAdress, String password) async {
    var uri = Uri.parse('https://10.0.2.2:7110/api/usuarios/login');
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    final body = jsonEncode({'email': mailAdress, 'senha': password});
    var response = await http.post(uri, headers: headers, body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
