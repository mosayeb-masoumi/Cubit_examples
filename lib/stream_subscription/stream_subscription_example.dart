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
    // return BlocProvider<StreamSubscriptionCubit>(
    //     create: (context) => StreamSubscriptionCubit(locator()),
    //     child: StreamSubscriptionPage(),);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => StreamSubscriptionCubit(locator())),
        ], child: IStreamSubscriptionPage());
  }


}


class IStreamSubscriptionPage extends StatefulWidget {
  const IStreamSubscriptionPage({Key? key}) : super(key: key);

  @override
  State<IStreamSubscriptionPage> createState() =>
      _IStreamSubscriptionPageState();
}

class _IStreamSubscriptionPageState extends State<IStreamSubscriptionPage> {

  late final StreamSubscriptionCubit bloc;

  late final StreamSubscription subscription;

  bool showLoading = false;
  bool showData = false;
  bool showError = false;
  String result = "";

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<StreamSubscriptionCubit>(context);
    subscriptionListener();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
  void subscriptionListener() {
    subscription = bloc.stream.listen((state) {
      if (state is StreamSubscriptionLoading) {
        setState(() {
          showLoading = true;
        });
      } else if (state is StreamSubscriptionError) {
        setState(() {
          showError = true;
          showLoading = false;
        });
      } else if (state is StreamSubscriptionLoaded) {
        setState(() {
          showLoading = false;
          showData = true;
          result = state.result;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [

            const SizedBox(height: 50,),
            ElevatedButton(onPressed: () {
              bloc.getDataStream();
            }, child: const Text("get data")),

            const SizedBox(height: 20,),

            if(showLoading == true)
             const Center(child: CircularProgressIndicator(),),
            if(showError)
              const Text("Error"),
            if(showData)
              Text(result)

          ],
        ),
      ),
    );
  }
}




