
import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final Function? bottomSheetCallBack;
  final BuildContext blocContext;
  const MyBottomSheet({Key? key, required this.bottomSheetCallBack, required this.blocContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width,
      color: Colors.red,

      child: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
          bottomSheetCallBack!(0 , blocContext);
        }, child: const Text("TestCallback")),

      ),
    );
  }
}
