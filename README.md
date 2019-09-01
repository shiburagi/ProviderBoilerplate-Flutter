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
                auth: (c) => Page(title: "Login Page"),
                landing: (c) => Page(title: "User Page"),
                hasAccess: (d) => d,
                onStart: onStart,
              ),
            );
          }),
    );
  }
}

```

### BloC

```dart
class PageBloc extends BaseBloc<int> {
  PageBloc() : super() {
    setPage(0);
  }
  setPage(int page) {
    sink.add(page);
  }

  Widget getPage([int index]) {
    switch (index ?? data) {
      case 0:
        return ButtonPage();
      case 1:
        return TextFieldPage();
      case 2:
        return DropdownPage();
      default:
        return Container();
    }
  }
}
```

### State

```dart
class Page extends StatefulWidget {
  final String title;
  Page({this.title});
  @override
  _PageState createState() => _PageState();
}
class _PageState extends BlocState<Page, PageBloc> {
  @override
  Widget build(BuildContext context) {
    ThemeBloc themeBloc = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: StreamBuilder<int>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            return BottomAppBar(
              child: BottomNavigationBar(
                currentIndex: snapshot.data ?? 0,
                backgroundColor: Colors.transparent,
                iconSize: 0,
                elevation: 0,
                items: barItems(),
                onTap: bloc.setPage,
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

## TextField
```dart
DecorTextField(
  formFieldColor: fieldColor,
  cardEffect: true,
  elevation: 4.0,
  variant: FormFieldVariant.transparent,
  decoration: InputDecoration(
    labelText: "Card",
  ),
),
```
