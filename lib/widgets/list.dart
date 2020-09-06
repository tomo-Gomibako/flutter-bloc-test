import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rx/blocs/add_list.dart';

class ListPage extends StatelessWidget {
  ListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<AddListBloc, List>(
        builder: (_, list) {
          final tiles = list.map((n) => ListTile(title: Text(n.toString())));
          final divided =
              ListTile.divideTiles(context: context, tiles: tiles).toList();
          if (list == null || list.isEmpty) {
            return Center(child: Text('List is Empty'));
          }
          return ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: divided,
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'push_list',
            tooltip: 'push_list',
            child: const Icon(Icons.add),
            onPressed: () => context.bloc<AddListBloc>().push(),
          ),
        ],
      ),
    );
  }
}
