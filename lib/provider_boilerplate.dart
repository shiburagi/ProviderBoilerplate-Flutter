library provider_boilerplate;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'bloc/base_bloc.dart';
import 'package:flutter/foundation.dart';

export 'bloc/base_bloc.dart';
export 'bloc/bloc_state.dart';
export 'components/button.dart';
export 'components/dropdown.dart';
export 'components/textfield.dart';
export 'components/form_field.dart';
export 'components/radio.dart';
export 'package:provider/provider.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';
export 'utils/assets.dart';

class ProviderBoilerplate extends StatelessWidget {
  final List<SingleChildWidget> providers;
  final Widget child;

  final Function(BuildContext, FlutterErrorDetails) errorWidget;
  ProviderBoilerplate({
    this.providers,
    this.errorWidget,
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode && errorWidget != null) {
      ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
        return errorWidget(context, errorDetails);
      };
    }
    log("providers: ${providers.length}");
    return MultiProvider(
      providers: this.providers,
      child: this.child,
    );
  }
}

Provider<T> registerProvider<T>(T blocBase) {
  return Provider<T>(
    create: (context) => blocBase,
    dispose: (context, bloc) => (blocBase as BaseBloc).dispose(),
  );
}

class SplashBuilder<T> extends StatefulWidget {
  final WidgetBuilder splash;
  final WidgetBuilder auth;
  final WidgetBuilder landing;
  final String authRoute;
  final String landingRoute;
  final Future Function(BuildContext) onStart;
  final bool Function(dynamic) hasAccess;

  SplashBuilder({
    Key key,
    @required this.onStart,
    @required this.hasAccess,
    this.splash,
    this.auth,
    this.landing,
    this.authRoute,
    this.landingRoute,
  })  : assert(auth == null || authRoute == null),
        assert(landing == null || landingRoute == null),
        super(key: key);
  @override
  _SplashBuilderState<T> createState() => _SplashBuilderState<T>();
}

class _SplashBuilderState<T> extends State<SplashBuilder> {
  bool _hasAccess;
  @override
  void initState() {
    super.initState();
  }

  void redirect(String route) {
    if (route != null) Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.widget.onStart(context).then((value) {
      _hasAccess = widget.hasAccess(value);

      if (widget.landingRoute != null || widget.authRoute != null)
        redirect(_hasAccess ? widget.landingRoute : widget.authRoute);
      if (widget.landing != null || widget.auth != null) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_hasAccess != null) {
      return _hasAccess
          ? widget?.landing?.call(context) ?? buildSplash(context)
          : widget?.auth?.call(context) ?? buildSplash(context);
    }

    return buildSplash(context);
  }

  Scaffold buildSplash(BuildContext context) {
    return this.widget.splash != null
        ? this.widget.splash(context)
        : buildDefaultSplash(context);
  }

  Scaffold buildDefaultSplash(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: SizedBox(
            width: 96,
            height: 96,
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
