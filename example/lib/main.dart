import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider_boilerplate/provider_boilerplate.dart';

void main() => SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      runApp(new MyApp());
    });

class MyApp extends StatelessWidget {

  Future<bool> onStart(BuildContext context) async{
    await Future.delayed(Duration(seconds: 2));

    return Random().nextBool();
  }
  @override
  Widget build(BuildContext context) {
    return ProviderBoilerplate(
      child: MaterialApp(
        home: SplashPage(
          auth: (c) => Scaffold(body: Center(child: Text("Login Page"),)),
          landing: (c) => Scaffold(body: Center(child: Text("User Page"),)),
          isValid: (d) => d,
          onStart: (c) => onStart(context),
        ),
      ),
    );
  }
}
