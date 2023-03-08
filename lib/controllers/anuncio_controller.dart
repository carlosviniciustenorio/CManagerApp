import 'package:cmanagerapp/repositories/anuncio_repository.dart';
import 'package:flutter/material.dart';
import '../enums/state_default_enum.dart';
import '../models/anuncio_model.dart';

class AnuncioController {
  final state = ValueNotifier<StateDefault>(StateDefault.start);
  final _anuncioRepository = AnuncioRepository();

  Future<Anuncio> get(String id) async {
    state.value = StateDefault.loading;
    var response = await _anuncioRepository.getAnuncio(id);
    if (response != null)
      state.value = StateDefault.success;
    else
      state.value = StateDefault.error;

    return response;
  }
}
