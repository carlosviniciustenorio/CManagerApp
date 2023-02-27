import 'dart:convert';

import 'package:cmanagerapp/repositories/login_repository.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class LoginController {
  final _loginRepository = LoginRepository();
  Future<bool> loginUser(User user) async {
    var response = await _loginRepository.authenticate(user);
    if (response['sucesso']) {
      return true;
    } else {
      return false;
    }
  }
}
