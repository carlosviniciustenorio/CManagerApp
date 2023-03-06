import 'package:flutter/material.dart';

import '../../models/anuncio_model.dart';

class AnuncioWidget extends StatelessWidget {
  static Anuncio _anuncio = Anuncio();
  AnuncioWidget({required Anuncio anuncio}) {
    _anuncio = anuncio;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'assets/car.jpg',
                width: MediaQuery.of(context).size.width,
                height: 250,
              )),
              Row(
                children: <Widget>[
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.calendar_month),
                      title: Text('Ano: ' +
                          _anuncio.anoFabricacao.toString() +
                          '/' +
                          _anuncio.anoModelo.toString()),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.car_crash),
                      title: Text('KM: ' + _anuncio.km.toString() + ' mil'),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.price_change),
                      title: Text('Valor: ' + _anuncio.preco.toString()),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.location_city),
                      title: Text('Estado: ' + _anuncio.estado.toString()),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.turned_in),
                      title: Text('Versão: ' + _anuncio.versao.toString()),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
