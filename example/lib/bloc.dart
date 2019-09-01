import 'package:flutter/material.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';
import 'package:provider_boilerplate_example/components/button_page.dart';
import 'package:provider_boilerplate_example/components/dropdown_page.dart';
import 'package:provider_boilerplate_example/components/textfield_page.dart';

class ThemeBloc extends BaseBloc<ThemeMode> {
  ThemeBloc() : super(initialValue: ThemeMode.light);

  toggle() {
    ThemeMode _mode =
        data == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    sink.add(_mode);
  }
}

class PageBloc extends BaseBloc<int> {
  PageBloc() : super() {
    setPage(0);
  }

  setPage(int page) {
    sink.add(page);
  }

  Widget getPage([int index]) {
    switch (index ?? data) {
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
}
