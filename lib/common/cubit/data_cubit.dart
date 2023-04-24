import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_state.dart';

class DataCubit<T> extends Cubit<DataState<T>> {
  DataCubit({
    required T value,
  }) : super(
          DataState<T>(value: value),
        );

  void changeData(T value) {
    emit(state.copyWith(value: value));
  }
}
