import 'dart:convert';

import 'package:cmanagerapp/repositories/anuncio_repository.dart';
import 'package:flutter/material.dart';

import '../enums/state_default_enum.dart';
import '../models/anuncios_model.dart';

class HomeController {
  final state = ValueNotifier<StateDefault>(StateDefault.start);
  final _anuncioRepository = AnuncioRepository();
  static final List _anuncios = [];

  Future<List<Anuncios>> start() async {
    state.value = StateDefault.loading;
    var response = await _anuncioRepository.getAnuncios(0, 10);
    state.value = StateDefault.success;
    return response;
  }

  void refresh() {
    state.value = StateDefault.success;
  }
}
