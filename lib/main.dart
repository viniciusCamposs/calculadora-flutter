import 'package:calculator/pages/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.green,
      ),
      home: Splash(),
    );
  }
}
class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 10,
        navigateAfterSeconds: new CalculatorPage(),
        title: new Text('Calculadora',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
              color: Colors.greenAccent
          ),),
        image: new Image.asset("assets/images/calc_m.png"),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () {},
        loaderColor: Colors.greenAccent
    );
  }
}