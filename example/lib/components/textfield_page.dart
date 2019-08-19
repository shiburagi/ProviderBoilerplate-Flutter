import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_boilerplate/components/textfield.dart';

class TextFieldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: Column(
        children: <Widget>[
          Container(
            height: 24,
          ),
          DecorTextField(
            decoration: InputDecoration(
              labelText: "Default",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            variant: TextFieldVariant.outline,
            decoration: InputDecoration(
              labelText: "Outlined",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            variant: TextFieldVariant.filled,
            decoration: InputDecoration(
              labelText: "Filled",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            variant: TextFieldVariant.blurred,
            decoration: InputDecoration(
              labelText: "Blurred",
            ),
          ),
        ],
      ),
    );
  }
}
