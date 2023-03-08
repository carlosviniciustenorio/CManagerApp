import 'dart:convert';

import 'package:cmanagerapp/repositories/login_repository.dart';
import 'package:http/http.dart' as http;

import '../base/secure_storage_app.dart';
import '../enums/state_default_enum.dart';
import '../models/user_model.dart';

class LoginController {
  final _loginRepository = LoginRepository();
  StateDefault state = StateDefault.start;

  Future<bool> loginUser(User user) async {
    state = StateDefault.loading;
    var response = await _loginRepository.authenticate(user);
    if (response['sucesso']) {
      state = StateDefault.success;
      SecureStorageApp.Write('access_token', response['accessToken']);
      SecureStorageApp.Write('refresh_token', response['refreshToken']);
      return true;
    } else {
      state = StateDefault.error;
      return false;
    }
  }
}
