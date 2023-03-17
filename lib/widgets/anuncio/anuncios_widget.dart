import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/anuncios_model.dart';
import '../../views/anuncio/anuncio_page.dart';

class AnunciosWidget extends StatelessWidget {
  static Anuncios _anuncio = Anuncios();
  AnunciosWidget({required Anuncios anuncio}) {
    _anuncio = anuncio;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 235, 231, 231),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AnuncioPage(),
                settings: RouteSettings(arguments: _anuncio.id))),
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
                    child: CachedNetworkImage(
                  imageUrl: _anuncio.imagem.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.red, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
                        title: Text("${_anuncio.preco.toString()} mil",
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
