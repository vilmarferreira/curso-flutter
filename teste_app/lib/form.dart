import 'package:flutter/material.dart';

class FormDadosPessoais extends StatefulWidget {
  @override
  _FormDadosPessoaisState createState() => _FormDadosPessoaisState();
}

class _FormDadosPessoaisState extends State<FormDadosPessoais> {
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
                        decoration: new InputDecoration(labelText: "Nome"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(labelText: "CPF"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(labelText: "RG"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(labelText: "Sexo"),
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
