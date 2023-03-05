import 'package:cmanagerapp/widgets/anuncio/anuncio_widget.dart';
import 'package:flutter/material.dart';

import '../controllers/app_controller.dart';
import '../controllers/home_controller.dart';
import '../enums/home_state_enum.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final controller = HomeController();

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

  _success() {
    return Scaffold(
      drawer: Drawer(child: _drawer()),
      appBar: AppBar(
        title: Text("Anúncios"),
        actions: [CustomSwitch()],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return AnuncioWidget();
        },
      ),
    );
  }

  _error() {
    return Scaffold(
      body: Container(
        color: Colors.black,
        // width: double.infinity,
        // height: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Tentar novamente"),
        ),
      ),
    );
  }

  _loading() => Center(child: CircularProgressIndicator(color: Colors.white));

  _start() => Container();

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();

      case HomeState.success:
        return _success();

      case HomeState.error:
        return _error();

      default:
        return _loading();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        });
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
