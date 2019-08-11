import 'package:flutter/material.dart';

abstract class BaseBloc {
  BuildContext _context;
  BuildContext get context => _context;
  ThemeData _theme;

  ThemeData get theme => _theme;
  TextTheme get textTheme => _theme.textTheme;

  Color get primaryColor => _theme.primaryColor;
  Color get accentColor => _theme.accentColor;

  Size get screenSize => MediaQuery.of(context).size;
  EdgeInsets get screenPadding => MediaQuery.of(context).padding;

  Object get arguments => ModalRoute.of(context).settings.arguments;

  void register(BuildContext context) {
    this._context = context;
    this._theme = Theme.of(context);
  }

  void dispose();
}
