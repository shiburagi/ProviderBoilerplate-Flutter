import 'package:flutter/material.dart';

makeSnackbar(
        {@required BuildContext context,
        String text,
        SnackbarType type = SnackbarType.success}) =>
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: snackbarBackgroundColor(context)[type],
    ));

enum SnackbarType {
  default_,
  success,
  info,
  danger,
  warning,
}

Map<SnackbarType, Color> snackbarBackgroundColor(BuildContext context) => {
      SnackbarType.default_: Theme.of(context).cardColor,
      SnackbarType.success: Colors.green,
      SnackbarType.info: Theme.of(context).accentColor,
      SnackbarType.danger: Theme.of(context).errorColor,
      SnackbarType.warning: Colors.yellow,
    };

Map<SnackbarType, Color> snackbarForegroundColor(BuildContext context) => {
      SnackbarType.default_: Theme.of(context).textTheme.body1.color,
      SnackbarType.success: Colors.white,
      SnackbarType.success: Colors.white,
      SnackbarType.info: Colors.white,
      SnackbarType.danger: Colors.white,
      SnackbarType.warning: Colors.black,
    };
