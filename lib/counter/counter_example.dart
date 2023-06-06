import 'package:cubit_test/counter/counter_example_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterExample extends StatelessWidget {
  const CounterExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          child: BlocProvider(
            create: (context) => CounterCubit(),
            child: BlocListener<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  var a = 6;
                } else {
                  var a = 5;
                }
              },
              child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(state.counterValue.toString() , style: TextStyle(fontSize: 25 , color: Colors.red),),
                      ElevatedButton(onPressed: (){
                        context.read<CounterCubit>().increment();
                      }, child: Text("increment")),
                      ElevatedButton(onPressed: (){
                        context.read<CounterCubit>().decrement();
                      }, child: Text("decrement")),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
