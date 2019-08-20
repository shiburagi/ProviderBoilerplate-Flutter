import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';
import 'package:provider_boilerplate_example/bloc.dart';

List<BottomNavigationBarItem> barItems() {
  return [
    BottomNavigationBarItem(title: Text("BUTTON"), icon: Icon(Icons.title)),
    BottomNavigationBarItem(title: Text("TEXTFIELD"), icon: Icon(Icons.title)),
    BottomNavigationBarItem(title: Text("DROPDOWN"), icon: Icon(Icons.title)),
  ];
}

class Page extends StatelessWidget {
  final String title;
  Page({this.title});
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = Provider.of(context);
    ThemeBloc themeBloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      floatingActionButton: StreamBuilder<Brightness>(
          stream: themeBloc.stream,
          builder: (context, snapshot) {
            return FloatingActionButton.extended(
              onPressed: themeBloc.toggle,
              icon: Icon(snapshot.data == Brightness.light ?Icons.brightness_3:Icons.wb_sunny),
              label: Text(snapshot.data == Brightness.light ? "Dark" : "Light"),
            );
          }),
      body: SingleChildScrollView(
          child: StreamBuilder<int>(
              stream: pageBloc.stream,
              builder: (context, snapshot) {
                return pageBloc.getPage(snapshot.data ?? 0);
              })),
      bottomNavigationBar: StreamBuilder<int>(
          stream: pageBloc.stream,
          builder: (context, snapshot) {
            return BottomAppBar(
              child: BottomNavigationBar(
                currentIndex: snapshot.data ?? 0,
                backgroundColor: Colors.transparent,
                iconSize: 0,
                elevation: 0,
                items: barItems(),
                onTap: pageBloc.setPage,
              ),
            );
          }),
    );
  }
}
