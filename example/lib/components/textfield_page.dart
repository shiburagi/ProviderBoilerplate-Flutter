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
              hintText: "Default",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            borderType: TextFieldBorderType.outline,
            decoration: InputDecoration(
              hintText: "Outlined",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            borderType: TextFieldBorderType.filled,
            decoration: InputDecoration(
              hintText: "Filled",
            ),
          ),
          Container(
            height: 24,
          ),
          DecorTextField(
            borderType: TextFieldBorderType.blurred,
            decoration: InputDecoration(
              hintText: "Blurred",
            ),
          ),
        ],
      ),
    );
  }
}
