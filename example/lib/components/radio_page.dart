import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';

class RadioPage extends StatelessWidget {
  final List<RadioItem<String>> _items = [
    RadioItem(
      child: Text("example 1"),
      value: "example 1",
    ),
    RadioItem(
      child: Text("example 2"),
      value: "example 2",
    ),
    RadioItem(
      child: Text("example 3"),
      value: "example 3",
    ),
    RadioItem(
      child: Text("example 4"),
      value: "example 4",
    ),
     RadioItem(
      child: Text("example 5"),
      value: "example 5",
    ),
  ];
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
          DecorRadioGroup<String>(
            value: "example 1",
            items: _items,
            formFieldColor: fieldColor,
          ),
          DecorRadioGroup<String>(
            groupStyle: RadioGroupStyle.vertical,
            value: "example 1",
            items: _items,
            formFieldColor: fieldColor,
          ),
          DecorRadioGroup<String>(
            groupStyle: RadioGroupStyle.grid,
            value: "example 1",
            items: _items,
            formFieldColor: fieldColor,
          ),
          Container(
            height: 24,
          ),
          DecorRadioGroup<String>(
            cardEffect: true,
            elevation: 4,
            value: "example 1",
            items: _items,
            formFieldColor: fieldColor,
          ),
          DecorRadioGroup<String>(
            cardEffect: true,
            elevation: 4,
            groupStyle: RadioGroupStyle.vertical,
            value: "example 1",
            items: _items,
            formFieldColor: fieldColor,
          ),
          DecorRadioGroup<String>(
            cardEffect: true,
            elevation: 4,
            groupStyle: RadioGroupStyle.grid,
            value: "example 1",
            items: _items,
            formFieldColor: fieldColor,
          ),
          Container(
            height: 24,
          ),
        ],
      ),
    );
  }
}
