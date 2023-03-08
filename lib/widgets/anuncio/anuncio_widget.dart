import 'package:flutter/material.dart';

import '../../models/anuncio_model.dart';
import '../../models/anuncios_model.dart';

class AnuncioWidget extends StatelessWidget {
  Anuncio? _anuncio;

  AnuncioWidget({required Anuncio anuncio}) {
    _anuncio = anuncio;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 235, 231, 231),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 231, 231),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 750,
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
                children: [
                  Flexible(
                    child: ListTile(
                      minVerticalPadding: 5,
                      leading: Icon(
                        Icons.turned_in_not,
                        color: Color.fromARGB(255, 2, 5, 23),
                      ),
                      title: Text(
                        "Modelo:  ${_anuncio?.modelo?.descricao?.toString()}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 124, 123, 123)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.text_snippet_outlined,
                          color: Color.fromARGB(255, 2, 5, 23)),
                      title: Text(
                          "${_anuncio?.modelo?.versao?.descricao.toString()}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 124, 123, 123))),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: ListTile(
                      leading: Icon(
                        Icons.calendar_month,
                        color: Color.fromARGB(255, 2, 5, 23),
                      ),
                      title: Text(
                        "${_anuncio?.modelo?.anoFabricacao.toString()} / ${_anuncio?.modelo?.anoModelo.toString()}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 124, 123, 123)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.car_crash_outlined,
                          color: Color.fromARGB(255, 2, 5, 23)),
                      title: Text("KM: ${_anuncio?.km.toString()} mil",
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
                      leading: Icon(Icons.price_change_outlined,
                          color: Color.fromARGB(255, 2, 5, 23)),
                      title: Text("${_anuncio?.preco.toString()} mil",
                          style: TextStyle(
                              color: Color.fromARGB(255, 124, 123, 123))),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.location_on_outlined,
                          color: Color.fromARGB(255, 2, 5, 23)),
                      title: Text("UF: ${_anuncio?.estado.toString()}",
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
                      leading: Icon(Icons.featured_play_list_outlined,
                          color: Color.fromARGB(255, 2, 5, 23)),
                      title: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _anuncio?.caracteristicas?.length,
                          itemBuilder: (context, index) {
                            return Text(
                                "${_anuncio?.caracteristicas?[index].descricao.toString()}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 124, 123, 123)));
                          }),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.settings_input_component_outlined,
                          color: Color.fromARGB(255, 2, 5, 23)),
                      title: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _anuncio?.opcionais?.length,
                        itemBuilder: (context, index) {
                          return Text(
                              "${_anuncio?.opcionais?[index].descricao.toString()}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 124, 123, 123)));
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
