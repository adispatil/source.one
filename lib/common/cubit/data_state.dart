part of 'data_cubit.dart';

class DataState<T> extends Equatable {
  const DataState({
    required this.value,
  });

  final T value;

  DataState<T> copyWith({
    T? value,
  }) {
    return DataState<T>(
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [value];
}
