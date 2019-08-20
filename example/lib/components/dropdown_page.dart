import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';

class DropdownPage extends StatelessWidget {
  final List<DropdownMenuItem<String>> _items = [
    DropdownMenuItem(
      child: Text("example 1"),
      value: "example 1",
    ),
    DropdownMenuItem(
      child: Text("example 2"),
      value: "example 2",
    ),
    DropdownMenuItem(
      child: Text("example 3"),
      value: "example 3",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTextfieldList(context, "Primary", FormFieldColor.primary),
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
          DecorDropDown<String>(
            value: "example 1",
            items: _items,
          ),
          Container(
            height: 24,
          ),
          DecorDropDown<String>(
            variant: FormFieldVariant.outlined,
            value: "example 1",
            items: _items,
          ),
          Container(
            height: 24,
          ),
          DecorDropDown<String>(
            variant: FormFieldVariant.rectOutlined,
            value: "example 1",
            items: _items,
          ),
          Container(
            height: 24,
          ),
          DecorDropDown<String>(
            variant: FormFieldVariant.filled,
            value: "example 1",
            items: _items,
          ),
          Container(
            height: 24,
          ),
          DecorDropDown<String>(
            variant: FormFieldVariant.blurred,
            value: "example 1",
            items: _items,
          ),
          Container(
            height: 24,
          ),
          DecorDropDown<String>(
            cardEffect: true,
            elevation: 4,
            variant: FormFieldVariant.transparent,
            value: "example 1",
            items: _items,
          ),
          Container(
            height: 24,
          ),
        ],
      ),
    );
  }
}
