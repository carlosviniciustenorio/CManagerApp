import 'dart:convert';

import 'package:cmanagerapp/repositories/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../base/secure_storage_app.dart';
import '../enums/state_default_enum.dart';
import '../models/user_model.dart';

class LoginController {
  final _loginRepository = LoginRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StateDefault state = StateDefault.start;

  Future<bool> signInWithMail(UserModel user) async {
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

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    var userCredential = await _auth.signInWithCredential(credential);
    SecureStorageApp.Write(
        'access_token', "${userCredential.credential?.token?.toString()}");
  }
}
