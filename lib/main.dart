import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart';

void main() async{

  //init the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox("MyBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        useMaterial3: false,                  //same version than in Youtube
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}