import 'package:cubit_test/get_data_from_server/data_cubit.dart';
import 'package:cubit_test/get_data_from_server/data_repository.dart';
import 'package:cubit_test/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';

class DataServerPage extends StatelessWidget {
  const DataServerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,

        child: BlocProvider(
          // create: (context) => DataCubit(DataRepository()),
          create: (context) => DataCubit(locator<DataRepository>()),
          child: BlocConsumer<DataCubit, DataState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              if(state is DataLoading){
                return Center(child: CircularProgressIndicator(color: Colors.red,),);
              } else if(state is DataLoaded){
                return Center(child: Text(state.myModel.title),);
              } else if(state is DataError){
                return Center(child: Text("error"),);
              }else{
                // means StudentListInitial
                final cubit = BlocProvider.of<DataCubit>(context);
                cubit.getData(0);
                return Container();
                // return getDataWiget(context);
              }
            },
          ),
        ),
      ),
    );
  }

  // Widget getDataWiget(BuildContext context) {
  //   final cubit = BlocProvider.of<DataCubit>(context);
  //   cubit.getData(0);
  //   return Container();
  // }
}
