import 'package:flutter/material.dart';
import 'package:teste_app/login_page.dart';
//import 'home.dart';
import 'teste_login.dart';
import 'dash_board.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Score Escolar';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomePage(),
    );
  }
}
