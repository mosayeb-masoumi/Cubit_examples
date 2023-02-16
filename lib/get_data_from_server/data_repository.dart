import 'package:cubit_test/get_data_from_server/model.dart';

class DataRepository{

  Future<MyModel> getToken(int? id) async{

    await Future.delayed(Duration(seconds: 2));
    String token = "kjkkdfgkjsdj";

    MyModel myModel = MyModel(title: token);
    return myModel;
    // throw Exception();  // to make error
  }
}