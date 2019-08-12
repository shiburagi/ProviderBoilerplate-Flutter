import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';

class ThemeBloc extends BaseBloc {
  StreamController<Brightness> _streamController = StreamController();
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
