import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';
import 'package:provider_boilerplate_example/components/button_page.dart';
import 'package:provider_boilerplate_example/components/dropdown_page.dart';
import 'package:provider_boilerplate_example/components/textfield_page.dart';

class ThemeBloc extends BaseBloc {
  final StreamController<Brightness> _streamController = StreamController();
  Stream<Brightness> stream;
  Brightness _brightness;

  ThemeBloc() {
    stream = _streamController.stream.asBroadcastStream();
    toggle();
  }

  toggle() {
    _brightness =
        _brightness == Brightness.light ? Brightness.dark : Brightness.light;
    _streamController.sink.add(_brightness);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}

class PageBloc extends BaseBloc {
  final StreamController<int> _streamController = StreamController();
  Stream<int> stream;

  PageBloc() {
    stream = _streamController.stream.asBroadcastStream();
    setPage(0);
  }

  setPage(int page) {
    _streamController.sink.add(page);
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return ButtonPage();
      case 1:
        return TextFieldPage();
      case 2:
        return DropdownPage();
      default:
        return Container();
    }
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
