library provider_boilerplate;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc/base_bloc.dart';
import 'package:flutter/foundation.dart';

export 'bloc/base_bloc.dart';
export 'bloc/bloc_state.dart';
export 'components/button.dart';
export 'components/dropdown.dart';
export 'components/textfield.dart';
export 'components/form_field.dart';
export 'package:provider/provider.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';

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

class SplashPage<T> extends StatefulWidget {
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
  _SplashPageState<T> createState() => _SplashPageState<T>();
}

class _SplashPageState<T> extends State<SplashPage> {
  bool willReceiveNewData = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: this.widget.onStart(context),
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (!willReceiveNewData ||
              snapshot.connectionState == ConnectionState.done) {
            willReceiveNewData = false;
            return widget.hasAccess(snapshot.data)
                ? widget.landing(context)
                : widget.auth(context);
          }

          return this.widget.splash != null
              ? this.widget.splash(context)
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
