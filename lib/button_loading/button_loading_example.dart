import 'package:cubit_test/button_loading/button_loading_cubit.dart';
import 'package:cubit_test/get_data_from_server/data_repository.dart';
import 'package:cubit_test/locator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class ButtonLoadingExample extends StatelessWidget {
  const ButtonLoadingExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: BlocProvider(
              // create: (context) => ButtonLoadingCubit(DataRepository()),
              create: (context) => ButtonLoadingCubit(locator<DataRepository>()),
              child: BlocConsumer<ButtonLoadingCubit , ButtonLoadingState>(
                listener: (context , state){
                  if(state is ButtonLoadingError){
                    // show snackbar
                  }else if (state is ButtonLoadingLoaded){
                    // for example go to next page
                    var snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.myModel.title),
                      duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context , state){
                  if(state is ButtonLoadingLoading){
                    return buildLoading("loading" , size ,context);
                  }else if(state is ButtonLoadingLoaded){
                    return buildLoading("loaded" ,size ,context);

                  }else{
                    // final cubit = BlocProvider.of<DataCubit>(context);
                    // cubit.getData(0);
                    // final cubit = BlocProvider.of<ButtonLoadingCubit>(context);
                    // cubit.getData("example key");
                    return buildLoading("initial" ,size , context);
                  }
                },
              ) ,
          ),
        ),
      ),
    );
  }

  Widget buildLoading(String type, Size size, BuildContext context) {
    if(type == "loading"){
      return Container(
        width: size.width,
        height: 50,
        color: Colors.blue,
        margin: EdgeInsets.all(10),
        child: Center(child: CircularProgressIndicator(color: Colors.white,),),
      );
    }else{
      return InkWell(
        onTap: (){
          final cubit = BlocProvider.of<ButtonLoadingCubit>(context);
          cubit.getData("example data");
        },
          child: Container(
            width: size.width,
            height: 50,
            color: Colors.blue,
            margin: EdgeInsets.all(10),
            child: Center(child: Text("get data"),),
          ));
    }
  
  }
}
