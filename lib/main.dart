import 'dart:io';

import 'package:flutter/material.dart';

import 'app_widget.dart';

main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(AppWidget());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
