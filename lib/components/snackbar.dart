import 'package:flutter/material.dart';
import 'package:provider_boilerplate/palettes/colors.dart';

makeSnackbar(
        {@required BuildContext context,
        String text,
        SnackbarType type = SnackbarType.success}) =>
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        style: TextStyle(color: snackbarForegroundColor(context)[type]),
      ),
      backgroundColor: snackbarBackgroundColor(context)[type],
    ));

enum SnackbarType {
  default_,
  primary,
  accent,
  success,
  info,
  danger,
  warning,
}

Map<SnackbarType, Color> snackbarBackgroundColor(BuildContext context) => {
      SnackbarType.default_: Theme.of(context).cardColor,
      SnackbarType.primary: Theme.of(context).primaryColor,
      SnackbarType.accent: Theme.of(context).accentColor,
      SnackbarType.success: ColorsPalette.success,
      SnackbarType.info: Theme.of(context).accentColor,
      SnackbarType.danger: Theme.of(context).errorColor,
      SnackbarType.warning: ColorsPalette.warning,
    };

Map<SnackbarType, Color> snackbarForegroundColor(BuildContext context) => {
      SnackbarType.default_: Theme.of(context).textTheme.body1.color,
      SnackbarType.primary: Theme.of(context).primaryTextTheme.button.color,
      SnackbarType.accent: Theme.of(context).primaryTextTheme.button.color,
      SnackbarType.success: Colors.white,
      SnackbarType.info: Colors.white,
      SnackbarType.danger: Colors.white,
      SnackbarType.warning: Colors.black,
    };
