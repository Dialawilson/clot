import 'package:flutter/material.dart';
// import 'package:clot/screens/Home/Home.dart';
import 'package:clot/screens/splash/Splash.dart';

void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Clot App',
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}