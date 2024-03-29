import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:teste_app/pessoa.dart';
import 'listposts.dart';
import 'curso.dart';

//import 'listcursos.dart';


Future<List<Curso>> fetchcursos(http.Client client) async {
  final response = await client.get('https://hackathon-uni.herokuapp.com/api/curso/');

  return compute(parsecursos, response.body);
}

List<Curso> parsecursos(String responseBody) {
  print(responseBody);
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Curso>((json) => Curso.fromJson(json)).toList();
}

class HomePageScreen extends StatelessWidget {
  final String title;
  Pessoa pessoa;

  HomePageScreen({Key key, this.title, this.pessoa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(pessoa.nome);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Curso>>(
        future: fetchcursos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListViewcursos(cursos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}