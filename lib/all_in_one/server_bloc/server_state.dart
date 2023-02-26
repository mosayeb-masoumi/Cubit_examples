part of 'server_cubit.dart';

@immutable
abstract class ServerState {
  const ServerState();
}

class ServerInitial extends ServerState {
  const ServerInitial();
}

class ServerLoading extends ServerState {
  const ServerLoading();
}


class ServerLoaded extends ServerState {
  final MyModel myModel;
  const ServerLoaded(this.myModel);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerLoaded &&
          runtimeType == other.runtimeType &&
          myModel == other.myModel;

  @override
  int get hashCode => myModel.hashCode;
}


class ServerError extends ServerState {

  final String error;

  const ServerError(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerError &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;

// @override
  // List<Object> get props => [error];
}






//////////////////////////////////////////////////////////////////////////////////////

// to get list

class ServerListLoading extends ServerState {
  const ServerListLoading();
}


class ServerListLoaded extends ServerState {
  final List<UserModel> list;
  const ServerListLoaded(this.list);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerListLoaded &&
          runtimeType == other.runtimeType &&
          list == other.list;

  @override
  int get hashCode => list.hashCode;
}


class ServerListError extends ServerState {

  final String error;

  const ServerListError(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ServerError &&
              runtimeType == other.runtimeType &&
              error == other.error;

  @override
  int get hashCode => error.hashCode;

// @override
// List<Object> get props => [error];
}


