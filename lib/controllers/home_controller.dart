import 'package:flutter/material.dart';

import '../enums/home_state_enum.dart';

class HomeController {
  final state = ValueNotifier<HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    state.value = HomeState.success;
  }
}
