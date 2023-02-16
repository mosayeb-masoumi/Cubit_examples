part of 'data_cubit.dart';

@immutable
abstract class DataState {
  const DataState();
}

class DataInitial extends DataState {
  const DataInitial();
}

class DataLoading extends DataState {
  const DataLoading();
}

class DataLoaded extends DataState {

  final MyModel myModel;
  const DataLoaded(this.myModel);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataLoaded &&
          runtimeType == other.runtimeType &&
          myModel == other.myModel;

  @override
  int get hashCode => myModel.hashCode;
}



class DataError extends DataState {
  final String error;

  const DataError(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataError &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}
