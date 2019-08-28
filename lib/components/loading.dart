import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  final bool loading;
  final Widget child;
  LoadingView({
    this.loading = false,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      child: AbsorbPointer(
        absorbing: true,
        child: Container(
          color: Colors.white54,
          child: child ??
              SpinKitFoldingCube(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
