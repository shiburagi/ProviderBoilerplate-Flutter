import 'package:flutter/material.dart';
import 'package:provider_boilerplate/provider_boilerplate.dart';
import 'package:provider_boilerplate_example/bloc.dart';

List<BottomNavigationBarItem> barItems() {
  return [
    BottomNavigationBarItem(title: Text("BUTTON"), icon: Icon(Icons.title)),
    BottomNavigationBarItem(title: Text("TEXTFIELD"), icon: Icon(Icons.title)),
    BottomNavigationBarItem(title: Text("DROPDOWN"), icon: Icon(Icons.title)),
    BottomNavigationBarItem(title: Text("RADIO"), icon: Icon(Icons.title)),
  ];
}

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
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      floatingActionButton: StreamBuilder<ThemeMode>(
          stream: themeBloc.stream,
          builder: (context, snapshot) {
            return FloatingActionButton.extended(
              onPressed: themeBloc.toggle,
              icon: Icon(snapshot.data == ThemeMode.light
                  ? Icons.brightness_3
                  : Icons.wb_sunny),
              label: Text(snapshot.data == ThemeMode.light ? "Dark" : "Light"),
            );
          }),
      body: SingleChildScrollView(
          child: StreamBuilder<int>(
              stream: bloc.stream,
              builder: (context, snapshot) {
                return bloc.getPage(snapshot.data ?? 0);
              })),
      bottomNavigationBar: StreamBuilder<int>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            return BottomAppBar(
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
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
