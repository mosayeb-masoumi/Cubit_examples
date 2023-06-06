part of 'stream_subscription_cubit.dart';

@immutable
abstract class StreamSubscriptionState {
  const StreamSubscriptionState();
}

class StreamSubscriptionInitial extends StreamSubscriptionState {
  const StreamSubscriptionInitial();
}

class StreamSubscriptionLoading extends StreamSubscriptionState {
  const StreamSubscriptionLoading();
}


class StreamSubscriptionLoaded extends StreamSubscriptionState {
  final String result ;
  const StreamSubscriptionLoaded(this.result);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreamSubscriptionLoaded &&
          runtimeType == other.runtimeType &&
          result == other.result;

  @override
  int get hashCode => result.hashCode;

}


class StreamSubscriptionError extends StreamSubscriptionState {
  final String Error;
  const StreamSubscriptionError(this.Error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreamSubscriptionError &&
          runtimeType == other.runtimeType &&
          Error == other.Error;

  @override
  int get hashCode => Error.hashCode;
}
