import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_app/pessoa.dart';
import 'package:teste_app/post.dart';
import 'curso.dart';
class FormDadosPessoais extends StatefulWidget {
  @override
  _FormDadosPessoaisState createState() => _FormDadosPessoaisState();
}

class _FormDadosPessoaisState extends State<FormDadosPessoais> {

  Future<Pessoa> createPost(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return Pessoa.fromJson(json.decode(response.body));
    });
  }

  static final CREATE_POST_URL = 'https://hackathon-uni.herokuapp.com/api/aluno/';
  TextEditingController nomeController = new TextEditingController();
  TextEditingController cpfController = new TextEditingController();
  TextEditingController rgController = new TextEditingController();
  TextEditingController sexoController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Formulário pessoal"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new Form(
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        controller: nomeController,
                        decoration: new InputDecoration(labelText: "Nome"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        controller: cpfController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(labelText: "CPF"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        controller: rgController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(labelText: "RG"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        controller: sexoController,
                        decoration: new InputDecoration(labelText: "Sexo"),
                      ),
                    ),
                    new RaisedButton(
                        onPressed: () async {
                          Pessoa newPost = new Pessoa(id: 123,
                              nome: nomeController.text, cpf: cpfController.text, rg: rgController.text, sexo: sexoController.text);
                          Pessoa p = await createPost(CREATE_POST_URL,

                              body: newPost.toMap());
                          print(p.nome);
                      }
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );

  }
}
