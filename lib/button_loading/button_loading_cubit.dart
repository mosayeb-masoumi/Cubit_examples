import 'package:bloc/bloc.dart';
import 'package:cubit_test/get_data_from_server/data_repository.dart';
import 'package:cubit_test/get_data_from_server/model.dart';
import 'package:meta/meta.dart';

part 'button_loading_state.dart';

class ButtonLoadingCubit extends Cubit<ButtonLoadingState> {
  DataRepository repository;
  ButtonLoadingCubit(this.repository) : super(ButtonLoadingInitial());


  Future<dynamic> getData(String title) async{
    try{
      emit(ButtonLoadingLoading());
      var result = await repository.getToken(0);
      MyModel myModel = result;
      emit(ButtonLoadingLoaded(myModel));
    }on Exception{
      emit(ButtonLoadingError("error occured"));
    }
  }
}
