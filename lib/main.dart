
import 'package:cubit_test/button_loading/button_loading_example.dart';
import 'package:cubit_test/counter/counter_example.dart';
import 'package:cubit_test/get_data_from_server/get_data_from_server_page.dart';
import 'package:cubit_test/mult_provider/multi_provider_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // home: CounterExample(),
      // home: MultiProviderPage(),
      // home: DataServerPage(),
      home: ButtonLoadingExample(),
    );
  }
}

