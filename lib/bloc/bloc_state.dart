import 'package:flutter/material.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';

abstract class BlocState<T extends StatefulWidget, T2 extends BaseBloc> extends State<T>{
    T2 get bloc => Provider.of<T2>(context, listen: false)..register(context);

    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
    }
}