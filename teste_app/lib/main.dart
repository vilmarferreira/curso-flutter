import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Score Escolar';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomePage(title: appTitle),
    );
  }
}
