import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../../models/anuncios_model.dart';
import '../../views/anuncio/anuncio_page.dart';

class AnunciosWidget extends StatelessWidget {
  static Anuncios _anuncio = Anuncios();
  AnunciosWidget({super.key, required Anuncios anuncio}) {
    _anuncio = anuncio;
  }

  @override
  Widget build(BuildContext context) {
    var formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Card(
      // color: Color.fromARGB(221, 110, 110, 110),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AnuncioPage(),
                settings: RouteSettings(arguments: _anuncio.id))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(214, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    heightFactor: 1.2,
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageUrl: "${_anuncio.imagem?.arn?.toString()}",
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    )),
                Row(
                  children: [
                    Flexible(
                      child: ListTile(
                        minVerticalPadding: 5,
                        leading: Icon(
                          Icons.turned_in,
                          color: Color.fromARGB(255, 2, 5, 23),
                        ),
                        title: Text(
                          "Modelo:  ${_anuncio.modelo?.descricao?.toString()}",
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
                            "${_anuncio.modelo?.versao?.descricao.toString()}",
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
                          "${_anuncio.modelo?.anoFabricacao.toString()} / ${_anuncio.modelo?.anoModelo.toString()}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 124, 123, 123)),
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListTile(
                        leading: Icon(Icons.car_crash,
                            color: Color.fromARGB(255, 2, 5, 23)),
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
                            color: Color.fromARGB(255, 2, 5, 23)),
                        title: Text("${formatador.format(_anuncio.preco)}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123))),
                      ),
                    ),
                    Flexible(
                      child: ListTile(
                        leading: Icon(Icons.location_city,
                            color: Color.fromARGB(255, 2, 5, 23)),
                        title: Text("UF: ${_anuncio.estado.toString()}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
