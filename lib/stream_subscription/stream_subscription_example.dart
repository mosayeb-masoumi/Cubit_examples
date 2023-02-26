import 'dart:async';

import 'package:cubit_test/stream_subscription/bloc/stream_subscription_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit_test/locator.dart';


class StreamSubscriptionPage extends StatefulWidget {

  const StreamSubscriptionPage({Key? key}) : super(key: key);

  @override
  State<StreamSubscriptionPage> createState() => _StreamSubscriptionPageState();
}

class _StreamSubscriptionPageState extends State<StreamSubscriptionPage> {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StreamSubscriptionCubit()),

      ],
      child: IstreamSubscriptionPage (),
    );
  }
}




class IstreamSubscriptionPage extends StatefulWidget {
  const IstreamSubscriptionPage({Key? key}) : super(key: key);

  @override
  State<IstreamSubscriptionPage> createState() => _IstreamSubscriptionPageState();
}

class _IstreamSubscriptionPageState extends State<IstreamSubscriptionPage> {

  int digit = 0;

  late StreamSubscription<int> _streamSubscription;

  @override
  void initState() {
    super.initState();

    initStream();

  }

  void initStream() {
    _streamSubscription = context.read<StreamSubscriptionCubit>().myStream.listen((data) {
      // Do something with the data
      setState(() {
        digit = data;
        var d= 5;
      });
    });
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
            ElevatedButton(onPressed: (){
              context.read<StreamSubscriptionCubit>().addDataToStream(digit);
            }, child: Text("Add digit")),
            Center(child: Text(digit.toString()),),
          ],
        ),
      ),
    ) ;
  }


}

