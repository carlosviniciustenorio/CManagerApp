import 'package:cmanagerapp/controllers/anuncio_controller.dart';
import 'package:cmanagerapp/widgets/anuncio/anuncios_widget.dart';
import 'package:cmanagerapp/widgets/drawer/drawer_default_widget.dart';
import 'package:flutter/material.dart';

import '../../controllers/app_controller.dart';
import '../../controllers/home_controller.dart';
import '../../enums/state_default_enum.dart';
import '../../models/anuncios_model.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final controller = HomeController();
  final anuncioController = AnuncioController();
  ScrollController _scrollController = ScrollController();
  static List<Anuncios> _anuncios = [];

  _success() {
    return Scaffold(
      drawer: Drawer(child: DrawerDefaultWidget()),
      appBar: AppBar(
        title: Text("Anúncios"),
        actions: [
          IconButton(onPressed: () => '', icon: Icon(Icons.filter_list))
          // CustomSwitch()
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _anuncios.length,
        itemBuilder: (context, index) {
          return AnunciosWidget(anuncio: _anuncios[index]);
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

  stateManagement(StateDefault state) {
    switch (state) {
      case StateDefault.start:
        return _start();

      case StateDefault.success:
        return _success();

      case StateDefault.error:
        return _error();

      default:
        return _loading();
    }
  }

  @override
  void initState() {
    super.initState();
    setAnunciosList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getNewsAnuncios();
      }
    });
  }

  Future<void> setAnunciosList() async {
    if (_anuncios.isEmpty)
      _anuncios = await controller.start();
    else
      controller.refresh();
  }

  Future<void> getNewsAnuncios() async {
    var newItems = await anuncioController.getAnuncios(_anuncios.length, 15);
    setState(() {
      _anuncios.addAll(newItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: setAnunciosList(),
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
