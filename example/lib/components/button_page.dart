import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_boilerplate/components/button.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildButtonList(context, "Flat", ButtonVariant.flat),
        buildButtonList(context, "Raised", ButtonVariant.raised),
        buildButtonList(context, "Outlined", ButtonVariant.outlined),
      ],
    );
  }

  Container buildButtonList(
      BuildContext context, String title, ButtonVariant variant) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: Column(
        children: <Widget>[
          Divider(
            height: 24,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline,
          ),
          Divider(
            height: 24,
          ),
          DecorButton(
            fullWidth: true,
            variant: variant,
            onPressed: () {},
            child: Text("Default"),
          ),
          DecorButton(
            fullWidth: true,
            variant: variant,
            onPressed: () {},
            type: ButtonType.primary,
            child: Text("Primary"),
          ),
          DecorButton(
            fullWidth: true,
            variant: variant,
            onPressed: () {},
            type: ButtonType.accent,
            child: Text("Accent"),
          ),
          DecorButton(
            fullWidth: true,
            variant: variant,
            onPressed: () {},
            type: ButtonType.success,
            child: Text("Success"),
          ),
          DecorButton(
            fullWidth: true,
            variant: variant,
            onPressed: () {},
            type: ButtonType.warning,
            child: Text("Warning"),
          ),
          DecorButton(
            fullWidth: true,
            variant: variant,
            onPressed: () {},
            type: ButtonType.danger,
            child: Text("Danger"),
          ),
          DecorButton(
            fullWidth: true,
            variant: variant,
            onPressed: () {},
            isLoading: true,
            type: ButtonType.success,
            child: Text("Danger"),
          ),
          Container(
            height: 24,
          )
        ],
      ),
    );
  }
}
