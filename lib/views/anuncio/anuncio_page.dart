import 'package:flutter/material.dart';

import '../../controllers/anuncio_controller.dart';
import '../../enums/state_default_enum.dart';
import '../../models/anuncio_model.dart';
import '../../repositories/anuncio_repository.dart';
import '../../widgets/anuncio/anuncio_widget.dart';
import '../../widgets/drawer/drawer_default_widget.dart';

class AnuncioPage extends StatefulWidget {
  AnuncioPage() {}

  @override
  State<AnuncioPage> createState() => _AnuncioPageState();
}

class _AnuncioPageState extends State<AnuncioPage> {
  final _anuncioController = AnuncioController();
  final _anuncioRepository = AnuncioRepository();
  Anuncio _anuncio = Anuncio();

  @override
  Widget build(BuildContext context) {
    String anuncioId = ModalRoute.of(context)!.settings.arguments as String;

    return FutureBuilder(
        future: getAnuncio(anuncioId),
        builder: (context, child) {
          return stateManagement(_anuncioController.state.value);
        });
  }

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

  _success() {
    return Scaffold(
      drawer: Drawer(child: DrawerDefaultWidget()),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Anúncio'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return AnuncioWidget(anuncio: _anuncio);
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

  @override
  void initState() {
    super.initState();
  }

  Future<void> getAnuncio(String id) async {
    _anuncio = await _anuncioController.get(id);
  }
}
