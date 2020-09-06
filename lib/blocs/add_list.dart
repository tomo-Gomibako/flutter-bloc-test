import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddListBloc extends Cubit<List> {
  AddListBloc() : super(List<int>());

  void push() {
    Random rng = Random();
    int n = rng.nextInt(100);
    emit([...state, n]);
  }
}
