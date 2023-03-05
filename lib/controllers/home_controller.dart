import 'dart:convert';

import 'package:cmanagerapp/repositories/home_repository.dart';
import 'package:flutter/material.dart';

import '../enums/home_state_enum.dart';
import '../models/anuncio_model.dart';

class HomeController {
  final state = ValueNotifier<HomeState>(HomeState.start);
  final _homeRepository = HomeRepository();
  static final List _anuncios = [];

  Future<List<Anuncio>> start() async {
    state.value = HomeState.loading;
    var response = await _homeRepository.getAnuncios();
    state.value = HomeState.success;
    return response;
  }
}
