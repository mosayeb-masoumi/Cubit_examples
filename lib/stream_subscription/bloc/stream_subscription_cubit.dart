import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stream_subscription_state.dart';

class StreamSubscriptionCubit extends Cubit<StreamSubscriptionState> {
  StreamSubscriptionCubit() : super(StreamSubscriptionInitial());


  StreamController<int> _myStreamController = StreamController<int>();
  Stream<int> get myStream => _myStreamController.stream;

  void addDataToStream(int data) {
    final newDigit = data+5;
    _myStreamController.add(newDigit);
  }


  @override
  Future<void> close() async {
    await _myStreamController.close();
    return super.close();
  }

}
