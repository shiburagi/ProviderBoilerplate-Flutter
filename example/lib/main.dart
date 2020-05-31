import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';
import 'package:provider_boilerplate_example/bloc.dart';
import 'package:provider_boilerplate_example/page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(new MyApp());
  });
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
              // themeMode: mode,
              darkTheme: _buildThemeData(brightness: Brightness.dark),
              theme: _buildThemeData(brightness: Brightness.light),
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

ThemeData _buildThemeData({Brightness brightness: Brightness.light}) {
  return ThemeData(
    brightness: brightness,
    splashColor: Color(0xFF2ecc71),
    primarySwatch: Colors.amber,
    accentColor: brightness == Brightness.light ? Colors.black : Colors.white,
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.fromLTRB(16, 12, 16, 12)),
    textTheme: TextTheme(),
  );
}
