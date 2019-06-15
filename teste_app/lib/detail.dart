import 'package:flutter/material.dart';
import 'package:teste_app/form.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  void mostra_tela_form(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>FormDadosPessoais())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Informações"),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: mostra_tela_form,
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
