import 'package:bloc/bloc.dart';
import 'package:cubit_test/all_in_one/model/user_model.dart';
import 'package:cubit_test/all_in_one/my_repository.dart';
import 'package:cubit_test/get_data_from_server/model.dart';
import 'package:meta/meta.dart';

part 'server_state.dart';

class ServerCubit extends Cubit<ServerState> {

  final MyRepository _repository;
  ServerCubit(this._repository) : super(ServerInitial());

  Future<dynamic> getData() async{
    try{
      emit(ServerLoading());
      var result = await _repository.getData();
      MyModel myModel = result;
      emit(ServerLoaded(myModel));
    }on Exception{
      emit(ServerError("error"));
    }
  }


  Future<dynamic> getList() async{
    try{
      emit(ServerListLoading());
      var result = await _repository.getList();
      List<UserModel> userList = result;
      emit(ServerListLoaded(userList));
    }on Exception{
      emit(ServerListError("error"));
    }
  }

  Future<dynamic> toggleDataSelected(List<UserModel> list, int index) async {
    emit(ServerListLoading());
    list[index].selected = !list[index].selected;
    emit(ServerListLoaded(list));
  }


  Future<dynamic> changeNameSecondItem(List<UserModel> list, int index) async {
    emit(ServerListLoading());
    list[index].name = "milad changed";
    emit(ServerListLoaded(list));
  }
}
