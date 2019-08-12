import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';
import 'package:provider_boilerplate_example/bloc.dart';

class Page extends StatelessWidget {
  final String title;
  Page({this.title});
  @override
  Widget build(BuildContext context) {
    ThemeBloc themeBloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      floatingActionButton: StreamBuilder<Brightness>(
          stream: themeBloc.stream,
          builder: (context, snapshot) {
            return FloatingActionButton.extended(
              onPressed: themeBloc.toggle,
              label: Text(snapshot.data == Brightness.light ? "Dark" : "Light"),
            );
          }),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: Column(
          children: <Widget>[
            Container(
              height: 24,
            ),
            FillButton(
              fullWidth: true,
              onPressed: () {},
              child: Text("Default"),
            ),
            FillButton(
              fullWidth: true,
              onPressed: () {},
              type: ButtonType.primary,
              child: Text("Primary"),
            ),
            FillButton(
              fullWidth: true,
              onPressed: () {},
              type: ButtonType.accent,
              child: Text("Accent"),
            ),
            FillButton(
              fullWidth: true,
              onPressed: () {},
              type: ButtonType.success,
              child: Text("Success"),
            ),
            FillButton(
              fullWidth: true,
              onPressed: () {},
              type: ButtonType.warning,
              child: Text("Warning"),
            ),
            FillButton(
              fullWidth: true,
              onPressed: () {},
              type: ButtonType.danger,
              child: Text("Danger"),
            ),
          ],
        ),
      )),
    );
  }
}
