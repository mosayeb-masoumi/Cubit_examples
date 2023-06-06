import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubit_test/stream_subscription/stream_repository.dart';
import 'package:meta/meta.dart';

part 'stream_subscription_state.dart';

class StreamSubscriptionCubit extends Cubit<StreamSubscriptionState> {

  final StreamRepository _repository ;
  StreamSubscriptionCubit(this._repository) : super(StreamSubscriptionInitial());


  StreamController<int> _myStreamController = StreamController<int>();
  Stream<int> get myStream => _myStreamController.stream;

  Future<dynamic> getDataStream() async {

    try{
      emit(const StreamSubscriptionLoading());
      var result = await _repository.getData();
      emit(StreamSubscriptionLoaded(result));
    }catch(error){
      emit(StreamSubscriptionError(error.toString()));
    }
    // final newDigit = data+5;
    // _myStreamController.add(newDigit);
  }


  @override
  Future<void> close() async {
    await _myStreamController.close();
    return super.close();
  }

}
