//main.dart
import 'package:flutter/material.dart';
import 'package:galactic/screens/splash_screen.dart';


void main (){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
     home: SplashScreen(),
    );
  }
}

