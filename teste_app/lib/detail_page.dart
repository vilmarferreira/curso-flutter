import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:teste_app/form.dart';



class DetailPageScreen1 extends StatefulWidget {
  @override
  _DetailPageScreen1State createState() => _DetailPageScreen1State();
}

class _DetailPageScreen1State extends State<DetailPageScreen1> {



  @override
  Widget build(BuildContext context) {

    void mostra_tela_form(){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>FormDadosPessoais())
      );
    }
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/alucard.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Título do Curso',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Descrição breve do curso',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    );

    return Scaffold(
      body: body,
      appBar: AppBar(
        title: new Text('Informações'),
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


