# Provider Boilerplate

A boilerplate for flutter to organize provider, bloc and common components.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


## Installation
```yaml
  provider_boilerplate:
    git:
      url: git://github.com/shiburagi/ProviderBoilerplate-Flutter.git
```

## How to use 
```dart
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
```


## Components

### Button


#### Default
```dart
DecorButton(
  fullWidth: true,
  variant: variant,
  onPressed: () {},
  child: Text("Default"),
),
```

#### Primary
```dart
DecorButton(
  fullWidth: true,
  variant: variant,
  onPressed: () {},
  type: ButtonType.primary,
  child: Text("Primary"),
),
```

#### Accent
```dart
DecorButton(
  fullWidth: true,
  variant: variant,
  onPressed: () {},
  type: ButtonType.accent,
  child: Text("Accent"),
),
```

#### Success
```dart
DecorButton(
  fullWidth: true,
  variant: variant,
  onPressed: () {},
  type: ButtonType.success,
  child: Text("Success"),
),
```

#### Warning
```dart
DecorButton(
  fullWidth: true,
  variant: variant,
  onPressed: () {},
  type: ButtonType.warning,
  child: Text("Warning"),
),
```

#### Danger
```dart
DecorButton(
  fullWidth: true,
  variant: variant,
  onPressed: () {},
  type: ButtonType.danger,
  child: Text("Danger"),
),
```
