import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:provider_boilerplate/provider_boilerplate.dart';

void main() => SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      runApp(new MyApp());
    });

class ThemeBloc extends BaseBloc {
  StreamController<Brightness> _streamController = StreamController();
  Stream<Brightness> stream;
  Brightness _brightness;

  ThemeBloc() {
    stream = _streamController.stream.asBroadcastStream();
    toggle();
  }

  toggle() {
    _brightness =
        _brightness == Brightness.light ? Brightness.dark : Brightness.light;
    _streamController.sink.add(_brightness);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

ThemeBloc themeBloc = ThemeBloc();

class _MyAppState extends State<MyApp> {
  Future<bool> onStart(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));

    return Random().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderBoilerplate(
      providers: [
        registerProvider(themeBloc),
      ],
      child: StreamBuilder<Brightness>(
          stream: themeBloc.stream,
          builder: (context, snapshot) {
            Brightness brightness = snapshot.data;
            return MaterialApp(
              theme:
                  ThemeData(accentColor: Colors.purple, brightness: brightness),
              home: SplashPage(
                auth: (c) => Page(title: "Login Page"),
                landing: (c) => Page(title: "User Page"),
                isValid: (d) => d,
                onStart: (c) => onStart(context),
              ),
            );
          }),
    );
  }
}

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
