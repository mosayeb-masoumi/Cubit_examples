
import 'package:cubit_test/all_in_one/counter_new_bloc/counter_new_cubit.dart';
import 'package:cubit_test/all_in_one/model/user_model.dart';
import 'package:cubit_test/all_in_one/server_bloc/server_cubit.dart';
import 'package:cubit_test/all_in_one/widgets/bottomsheet_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit_test/locator.dart';

class AllInOnePage extends StatelessWidget {
  const AllInOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ServerCubit(locator())),
            BlocProvider(create: (context) => CounterNewCubit()),
          ],
          child: IallInOnePage(),
    );
  }
}





class IallInOnePage extends StatelessWidget  {

  List<UserModel> globalUserList = [];



  void bottomSheetCallBack(int id , BuildContext blocContext){
    blocContext.read<ServerCubit>().toggleDataSelected(globalUserList, 0);
    // final cubit = BlocProvider.of<ServerCubit>(blocContext);
    // cubit.toggleDataSelected(globalUserList, 0);
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return Scaffold(
     body: Container(
       width: size.width,
       height: size.height,

       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [

           BlocConsumer<ServerCubit , ServerState>(
               listener: (context , state){
                 if(state is ServerListLoaded){
                   globalUserList = state.list;
                 }
               },
               builder: (context , state){

                 return Column(
                   children: [
                     // if(state is ServerLoading)
                     //   Container(color:Colors.red ,width: size.width, height: 50, child: Center(child: CircularProgressIndicator(color: Colors.white,),)),
                     // if(state is ServerLoaded)
                     //   Container(color:Colors.red ,width:size.width, height: 50, child: Center(child: Text(state.myModel.title , style:TextStyle(color:Colors.white)),),),

                     SizedBox(height: 10,),

                     if(state is ServerListLoading)
                       Container(color:Colors.green ,width: size.width, height: 50, child: Center(child: CircularProgressIndicator(color: Colors.blue,),),),
                     if(state is ServerListLoaded)
                       Container(color:Colors.blueGrey ,width:size.width, height: 200,
                         child: ListView.builder(
                             itemCount: state.list.length,
                             itemBuilder: (context , index){
                               return
                                 GestureDetector(
                                   onLongPress: (){
                                     context.read<ServerCubit>().toggleDataSelected(state.list , index);
                                   },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      color: state.list[index].selected?Colors.green:Colors.red ,
                                      width: size.width, height: 50, child: Center(child: Text(state.list[index].name , style: TextStyle(color:Colors.white),),),));
                             }),)
                   ],
                 );

               },),

           
           ElevatedButton(onPressed: (){
             context.read<ServerCubit>().getList();
             // context.read<ServerCubit>().getData();
           }, child: Text("getDataFromServer")),



           ElevatedButton(onPressed: (){
             context.read<ServerCubit>().changeNameSecondItem(globalUserList, 1);
           }, child: Text("change second item")),


           ElevatedButton(onPressed: (){


             showModalBottomSheet(
                 context: context,
                 builder: (builder){
                   return MyBottomSheet(bottomSheetCallBack:bottomSheetCallBack , blocContext:context);
                 }
             );

           }, child: Text("open bottomSheet")),



         ],
       ),
     )
   );
  }
}
