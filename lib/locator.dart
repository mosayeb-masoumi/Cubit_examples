import 'package:cubit_test/all_in_one/counter_new_bloc/counter_new_cubit.dart';
import 'package:cubit_test/all_in_one/my_repository.dart';
import 'package:cubit_test/all_in_one/server_bloc/server_cubit.dart';
import 'package:cubit_test/get_data_from_server/data_cubit.dart';
import 'package:cubit_test/get_data_from_server/data_repository.dart';
import 'package:cubit_test/stream_subscription/bloc/stream_subscription_cubit.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUp(){

  locator.registerLazySingleton<DataRepository>(() => DataRepository());
  // locator.registerLazySingleton<DataCubit>(() => DataCubit(locator()));


  // AllInOnePage
  locator.registerLazySingleton<MyRepository>(() => ImyRepository());
  locator.registerLazySingleton<ServerCubit>(() => ServerCubit(locator()));
  locator.registerLazySingleton<CounterNewCubit>(() => CounterNewCubit());


  locator.registerLazySingleton<StreamSubscriptionCubit>(() => StreamSubscriptionCubit());

}