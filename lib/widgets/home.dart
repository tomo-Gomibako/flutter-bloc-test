import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rx/blocs/counter.dart';

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder(
                initialData: 0,
                stream: counterBloc.count,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => counterBloc.increment.add(null),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
