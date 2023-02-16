import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'number_state.dart';

class NumberCubit extends Cubit<NumberState> {
  NumberCubit() : super(NumberState(digit: 5));

  void increseNumber(int input){
    emit(NumberState(digit: state.digit+input));
  }
}
