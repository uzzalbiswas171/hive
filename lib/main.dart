import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_project_1/HomePage/homepage.dart';
import 'package:hive_project_1/UserInterface/userinterface.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box=await Hive.openBox("Mylist");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
     // home: const UserInterface(),
    );
  }
}
