import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';

class TextFieldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTextfieldList(context, "Primary", FormFieldColor.primary),
        buildTextfieldList(context, "Accent", FormFieldColor.accent),
      ],
    );
  }

  Container buildTextfieldList(
      BuildContext context, String title, FormFieldColor fieldColor) {
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
          DecorTextField(
            formFieldColor: fieldColor,
            decoration: InputDecoration(
              labelText: "Default",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            formFieldColor: fieldColor,
            variant: FormFieldVariant.outlined,
            decoration: InputDecoration(
              labelText: "Outlined",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            formFieldColor: fieldColor,
            variant: FormFieldVariant.rectOutlined,
            decoration: InputDecoration(
              labelText: "Rectangle Outlined",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            formFieldColor: fieldColor,
            variant: FormFieldVariant.filled,
            decoration: InputDecoration(
              labelText: "Filled",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            formFieldColor: fieldColor,
            variant: FormFieldVariant.blurred,
            decoration: InputDecoration(
              labelText: "Blurred",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            formFieldColor: fieldColor,
            variant: FormFieldVariant.blurred,
            decoration: InputDecoration(
              labelText: "Blurred",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            formFieldColor: fieldColor,
            cardEffect: true,
            elevation: 4.0,
            variant: FormFieldVariant.transparent,
            decoration: InputDecoration(
              labelText: "Card",
            ),
          ),
          Container(
            height: 24,
          ),
        ],
      ),
    );
  }
}
