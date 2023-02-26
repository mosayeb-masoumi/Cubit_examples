import 'package:bloc/bloc.dart';

part 'counter_new_state.dart';

class CounterNewCubit extends Cubit<CounterNewState> {
  CounterNewCubit() : super(CounterNewState(counterValue: 0,increment: false));

  void increment(){
   emit(CounterNewState(counterValue: state.counterValue+1, increment: true));
  }

  void decrement(){
    emit(CounterNewState(counterValue: state.counterValue-1, increment: false));
  }

}
