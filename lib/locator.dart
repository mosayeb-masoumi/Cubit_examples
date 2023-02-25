import 'package:cubit_test/get_data_from_server/data_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUp(){

  locator.registerLazySingleton<DataRepository>(() => DataRepository());

}