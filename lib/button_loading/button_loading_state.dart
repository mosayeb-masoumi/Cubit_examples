part of 'button_loading_cubit.dart';

@immutable
abstract class ButtonLoadingState {
  const ButtonLoadingState();
}

class ButtonLoadingInitial extends ButtonLoadingState {
  const ButtonLoadingInitial();
}

class ButtonLoadingLoading extends ButtonLoadingState {
  const ButtonLoadingLoading();
}

class ButtonLoadingLoaded extends ButtonLoadingState {
  final MyModel myModel;
  const ButtonLoadingLoaded(this.myModel);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ButtonLoadingLoaded && runtimeType == other.runtimeType &&
              myModel == other.myModel;

  @override
  int get hashCode => myModel.hashCode;


}

class ButtonLoadingError extends ButtonLoadingState {
  //
  final String error;
  const ButtonLoadingError(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ButtonLoadingError && runtimeType == other.runtimeType &&
              error == other.error;

  @override
  int get hashCode => error.hashCode;


}
