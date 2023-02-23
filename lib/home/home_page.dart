import 'package:flutter/material.dart';

import '../controllers/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  Widget _drawer() {
    return Column(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture:
              ClipOval(child: Image.asset('assets/profile.jpg')),
          accountName: Text('Carlos Tenorio'),
          accountEmail: Text('carlos.tenorio@gmail.com'),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          subtitle: Text('Home page'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: _drawer()),
      appBar: AppBar(
        title: Text("CManager"),
        actions: [CustomSwitch()],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $counter'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDarkTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
