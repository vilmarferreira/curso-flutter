import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_app/post.dart';
import 'curso.dart';
class FormDadosPessoais extends StatefulWidget {
  @override
  _FormDadosPessoaisState createState() => _FormDadosPessoaisState();
}

class _FormDadosPessoaisState extends State<FormDadosPessoais> {

  Future<Post> createPost(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return Post.fromJson(json.decode(response.body));
    });
  }

  static final CREATE_POST_URL = 'https://hackathon-uni.herokuapp.com/api/aluno/';
  TextEditingController titleControler = new TextEditingController();
  TextEditingController descricaoControler = new TextEditingController();

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
                        controller: titleControler,
                        decoration: new InputDecoration(labelText: "Nome"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        controller: descricaoControler,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(labelText: "CPF"),
                      ),
                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: new TextField(
//                        keyboardType: TextInputType.number,
//                        decoration: new InputDecoration(labelText: "RG"),
//                      ),
//                    ),
                    new RaisedButton(
                        onPressed: () async {
                          Curso newPost = new Curso(id: 123,
                              nome: titleControler.text, descricao: descricaoControler.text);
                          Post p = await createPost(CREATE_POST_URL,

                              body: newPost.toMap());
                          print(p.title);
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
