import 'package:cmanagerapp/repositories/home_repository.dart';
import 'package:flutter/material.dart';

import '../enums/home_state_enum.dart';

class HomeController {
  final state = ValueNotifier<HomeState>(HomeState.start);
  final _homeRepository = HomeRepository();
  static final List _anuncios = [];

  Future start() async {
    state.value = HomeState.loading;
    var anuncios = await _homeRepository.getAnuncios();
    state.value = HomeState.success;
  }
}
