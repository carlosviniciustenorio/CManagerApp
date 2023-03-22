import 'package:cmanagerapp/views/home/home_page.dart';
import 'package:cmanagerapp/views/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../base/secure_storage_app.dart';
import '../enums/state_default_enum.dart';

class AuthService {
  final state = ValueNotifier<StateDefault>(StateDefault.start);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData)
            return HomePage();
          else
            return LoginPage();
        });
  }

  signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    state.value = StateDefault.loading;

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    var userCredential = await _auth.signInWithCredential(credential);
    SecureStorageApp.Write(
        'access_token', "${userCredential.credential?.token?.toString()}");

    state.value = StateDefault.success;

    Navigator.pushReplacementNamed(context, '/home');
  }

  signOut() => FirebaseAuth.instance.signOut();
}
