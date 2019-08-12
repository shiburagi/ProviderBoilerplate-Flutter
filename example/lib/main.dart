import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';
import 'package:provider_boilerplate_example/bloc.dart';
import 'package:provider_boilerplate_example/page.dart';

void main() => SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      runApp(new MyApp());
    });

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
