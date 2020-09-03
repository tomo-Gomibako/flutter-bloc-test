import 'dart:async';

class CounterBloc {
  final _actionController = StreamController<void>();
  final _countController = StreamController<int>();

  Sink<void> get increment => _actionController.sink;
  Stream<int> get count => _countController.stream;

  int _count = 0;

  CounterBloc() {
    _actionController.stream.listen((_) {
      _countController.sink.add(++_count);
    });
  }

  void dispose() {
    _actionController.close();
    _countController.close();
  }
}
