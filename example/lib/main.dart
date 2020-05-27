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
      errorWidget: (context, errorDetails) => Container(),
      providers: [
        registerProvider(themeBloc),
        registerProvider(PageBloc()),
      ],
      child: StreamBuilder<ThemeMode>(
          stream: themeBloc.stream,
          builder: (context, snapshot) {
            ThemeMode mode = snapshot.data;
            return MaterialApp(
              themeMode: mode,
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                accentColor: Colors.purple,
              ),
              theme: ThemeData(
                accentColor: Colors.purple,
              ),
              home: SplashPage(
                auth: (c) => BasicPage(title: "Login Page"),
                landing: (c) => BasicPage(title: "User Page"),
                hasAccess: (d) => d,
                onStart: onStart,
              ),
            );
          }),
    );
  }
}
