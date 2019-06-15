import 'package:flutter/material.dart';
import 'package:teste_app/detail.dart';

import 'curso.dart';



class ListViewcursos extends StatelessWidget {


  final List<Curso> cursos;

  ListViewcursos({Key key, this.cursos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: cursos.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  title: Text(
                    '${cursos[position].nome}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${cursos[position].descricao}',
                    style: new TextStyle(
                      fontSize: 10.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 20.0,
                        child: Text(
                          'ID ${cursos[position].id}',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () => _onTapItem(context, cursos[position]),
                ),
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Curso curso) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(curso.id.toString() + ' - ' + curso.nome)));
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>DetailPage())
    );
  }
}
