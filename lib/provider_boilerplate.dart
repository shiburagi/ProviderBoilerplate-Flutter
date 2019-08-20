library provider_boilerplate;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc/base_bloc.dart';
import 'package:flutter/foundation.dart';

export 'bloc/base_bloc.dart';
export 'components/button.dart';
export 'components/dropdown.dart';
export 'components/textfield.dart';
export 'components/form_field.dart';
export 'package:provider/provider.dart';

class ProviderBoilerplate extends StatelessWidget {
  final List<SingleChildCloneableWidget> providers;
  final Widget child;

  final Function(BuildContext, FlutterErrorDetails) errorWidget;
  ProviderBoilerplate({
    this.providers = const [],
    this.errorWidget,
    this.child,
    Key key,
  }) : super(key: key);

  @required
  @override
  Widget build(BuildContext context) {
    if (kReleaseMode && errorWidget != null) {
      ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
        return errorWidget(context, errorDetails);
      };
    }
    return MultiProvider(
      providers: providers,
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
  final Future Function(BuildContext) onStart;
  final bool Function(dynamic) hasAccess;

  SplashPage({
    @required this.onStart,
    @required this.hasAccess,
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
            return hasAccess(snapshot.data) ? landing(context) : auth(context);
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
