import 'package:cmanagerapp/views/anuncio/anuncio_page.dart';
import 'package:cmanagerapp/views/home/home_page.dart';
import 'package:flutter/material.dart';

import 'controllers/app_controller.dart';
import 'views/login/login_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.black,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage(),
            '/anuncio': (context) => AnuncioPage(),
          },
        );
      },
    );
  }
}
