import 'package:cubit_test/all_in_one/model/user_model.dart';
import 'package:cubit_test/get_data_from_server/model.dart';

abstract class MyRepository {
  Future<dynamic> getData();
  Future<dynamic> getList();
}

class ImyRepository extends MyRepository {
  @override
  Future<dynamic> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    String token = "kkkkkkkkkkk";
    MyModel myModel = MyModel(title: token);
    return myModel;
  }

  @override
  Future<dynamic> getList() async {
    await Future.delayed(const Duration(seconds: 2));
    List<UserModel> list = [
     UserModel(name: "hassan", selected: false),
     UserModel(name: "reza", selected: false),
     UserModel(name: "ali", selected: false),
    ];
    return list;
  }
}
