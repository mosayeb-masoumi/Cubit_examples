import 'package:bloc/bloc.dart';
import 'package:cubit_test/get_data_from_server/data_repository.dart';
import 'package:cubit_test/get_data_from_server/model.dart';
import 'package:meta/meta.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {

  final DataRepository dataRepository;
  DataCubit(this.dataRepository) : super(DataInitial());

  Future<dynamic> getData(int id) async{
    try{
       emit(DataLoading());
       MyModel result = await dataRepository.getToken(1);
       MyModel myModel = result;
       emit(DataLoaded(myModel));
    }on Exception {
      emit(DataError("error occured"));
    }
  }
}
