import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rx/widgets/home.dart';
import 'package:flutter_rx/blocs/counter.dart';

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
      home: Provider<CounterBloc>(
        create: (context) => CounterBloc(),
        dispose: (context, bloc) => bloc.dispose(),
        child: Home(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
