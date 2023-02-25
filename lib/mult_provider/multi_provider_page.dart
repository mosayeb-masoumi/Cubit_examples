import 'package:cubit_test/mult_provider/number_cubit.dart';
import 'package:cubit_test/mult_provider/text_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiProviderPage extends StatelessWidget {
  const MultiProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,

        child: MultiBlocProvider(
          providers: [
            //first provider
            BlocProvider(create: (context) => NumberCubit()),
            //second provider
            BlocProvider(create: (context) => TextCubit(),),


          ],



          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<NumberCubit , NumberState>(
                listener: (context , state){

                },

                builder: (context , state){

                  return Column(
                    children: [
                      Text(state.digit.toString() , style: TextStyle(fontSize: 30),),
                      ElevatedButton(onPressed: (){
                      context.read<NumberCubit>().increseNumber(5);   // to change a widget from another cubit ------------------ so important
                      }, child: Text("increase 5"))
                    ],
                  );
                },
              ),

              SizedBox(height: 20,),


              BlocConsumer<TextCubit , TextState>(
                listener: (context , state){
                },

                builder: (context ,state){
                  return Column(
                    children: [
                      Text(state.name , style: TextStyle(fontSize: 30),),
                      ElevatedButton(onPressed: (){
                        context.read<TextCubit>().changedName("ali");

                        context.read<NumberCubit>().increseNumber(10);

                      }, child: Text("new Name"))
                    ],
                  );
                },
              )
            ],


          ),
        )
      ),
    );
  }
}
