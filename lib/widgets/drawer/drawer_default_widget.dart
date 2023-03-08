import 'package:flutter/material.dart';

import '../../models/anuncio_model.dart';
import '../../models/anuncios_model.dart';

class DrawerDefaultWidget extends StatelessWidget {
  DrawerDefaultWidget() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture:
              ClipOval(child: Image.asset('assets/profile.jpg')),
          accountName: Text('Carlos Tenorio'),
          accountEmail: Text('carlos.tenorio@gmail.com'),
        ),
        ListTile(
          leading: Icon(Icons.car_crash_rounded),
          title: Text('Anúncios'),
          onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () => Navigator.of(context).pushReplacementNamed('/'),
        )
      ],
    );
  }
}
