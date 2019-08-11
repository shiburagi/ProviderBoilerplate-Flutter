library provider_boilerplate;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc/base_bloc.dart';
import 'package:flutter/foundation.dart';

export 'bloc/base_bloc.dart';

Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
  return Center();
}

class ProviderBoilerplate extends StatelessWidget {
  final List blocs;
  final Widget child;
  ProviderBoilerplate({this.blocs = const [], this.child, Key key})
      : super(key: key);

  @required
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: this.blocs.map((bloc) => registerProvider(bloc)).toList(),
      child: this.child,
    );
  }
}

Provider<T> registerProvider<T>(T blocBase) {
  return Provider<T>(
    builder: (context) => blocBase,
    dispose: (context, bloc) => (blocBase as BaseBloc).dispose(),
  );
}

class SplashPage<T> extends StatelessWidget {
  final WidgetBuilder splash;
  final WidgetBuilder auth;
  final WidgetBuilder landing;
  final Function(BuildContext) onStart;
  final bool Function(dynamic) isValid;

  SplashPage({
    @required this.onStart,
    @required this.isValid,
    @required this.auth,
    @required this.landing,
    this.splash,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: this.onStart(context),
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.data != null) {
            return isValid(snapshot.data) ? auth(context) : landing(context);
          }

          return this.splash != null
              ? this.splash(context)
              : Scaffold(
                  body: Container(
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: SizedBox(
                        width: 96,
                        height: 96,
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(accentColor: Colors.white),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
