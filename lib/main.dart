import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rx/widgets/home.dart';
import 'package:flutter_rx/widgets/list.dart';
import 'package:flutter_rx/blocs/counter.dart';
import 'package:flutter_rx/blocs/add_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: Home(title: 'Flutter Demo Home Page'),
      ),
      routes: <String, WidgetBuilder>{
        "/home": (_) => BlocProvider(
              create: (_) => CounterBloc(),
              child: Home(title: 'Flutter Demo Home Page'),
            ),
        "/list": (_) => BlocProvider(
              create: (_) => AddListBloc(),
              child: ListPage(title: 'List Test'),
            ),
      },
    );
  }
}
