import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(
      //   appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
      //   //primaryColor: Color(0xFF0A0E21),
      //   scaffoldBackgroundColo.r: Color(0xFF0A0E21),
      //   textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      //   accentColor: Colors.purple,
      // ),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
      ),
      home: InputPage(),
    );
  }
}
