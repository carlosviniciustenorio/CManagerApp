import 'dart:convert';

import 'package:cmanagerapp/repositories/login_repository.dart';
import 'package:http/http.dart' as http;

import '../enums/home_state_enum.dart';
import '../models/user_model.dart';

class LoginController {
  final _loginRepository = LoginRepository();
  HomeState state = HomeState.start;

  Future<bool> loginUser(User user) async {
    state = HomeState.loading;
    var response = await _loginRepository.authenticate(user);
    if (response['sucesso']) {
      state = HomeState.success;
      return true;
    } else {
      state = HomeState.error;
      return false;
    }
  }
}
