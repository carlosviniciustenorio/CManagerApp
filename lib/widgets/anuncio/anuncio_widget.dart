import 'package:flutter/material.dart';

import '../../models/anuncio_model.dart';

class AnuncioWidget extends StatelessWidget {
  static Anuncio _anuncio = Anuncio();
  AnuncioWidget({required Anuncio anuncio}) {
    _anuncio = anuncio;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 235, 231, 231),
      child: GestureDetector(
        // onTap: () => Navigator.pushReplacementNamed(context, '/home'),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 231, 231),
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
                        leading: Icon(
                          Icons.calendar_month,
                          color: Color.fromARGB(255, 124, 123, 123),
                        ),
                        title: Text(
                          'Ano: ' +
                              _anuncio.anoFabricacao.toString() +
                              '/' +
                              _anuncio.anoModelo.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 124, 123, 123)),
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListTile(
                        leading: Icon(Icons.car_crash,
                            color: Color.fromARGB(255, 124, 123, 123)),
                        title: Text('KM: ' + _anuncio.km.toString() + ' mil',
                            style: TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123))),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: ListTile(
                        leading: Icon(Icons.price_change,
                            color: Color.fromARGB(255, 124, 123, 123)),
                        title: Text('Valor: ' + _anuncio.preco.toString(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123))),
                      ),
                    ),
                    Flexible(
                      child: ListTile(
                        leading: Icon(Icons.location_city,
                            color: Color.fromARGB(255, 124, 123, 123)),
                        title: Text('Estado: ' + _anuncio.estado.toString(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123))),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: ListTile(
                        leading: Icon(Icons.turned_in,
                            color: Color.fromARGB(255, 124, 123, 123)),
                        title: Text('Versão: ' + _anuncio.versao.toString(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123))),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
