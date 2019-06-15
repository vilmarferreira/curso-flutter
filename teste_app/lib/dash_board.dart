import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:teste_app/pessoa.dart';
import 'curso.dart';
import 'curso_nota.dart';
import 'detail.dart';



Future<List<CursoMedia>> fetchcursos(http.Client client,String pessoa) async {
  final response =
      await client.get('https://hackathon-uni.herokuapp.com/api/carregar/cursos/?nome=$pessoa');

  return compute(parsecursos, response.body);
}

List<CursoMedia> parsecursos(String responseBody) {
  print(responseBody);
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<CursoMedia>((json) => CursoMedia.fromJson(json)).toList();
}

class DashBoard extends StatefulWidget {
  Pessoa pessoa;
  DashBoard({Key key,  this.pessoa}) : super(key: key);
  @override
  _DashBoardState createState() => _DashBoardState(pessoa: pessoa);

}

class _DashBoardState extends State<DashBoard> {
  Pessoa pessoa;
  _DashBoardState({  this.pessoa}) : super();
  final Color accentColor = Color(0XFFFA2B0F);

// [
//    ItemModel("Tasks", 12, 1830),
//    ItemModel("Analytics", 4, 883),
//    ItemModel("Works", 2, 326),
//  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Widget _buildTitle() {

    return Text(
      "Listagem",
      style: TextStyle(
          fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Text _buildText(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  IconButton _buildButton(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  Widget _buildBottomCardChildren() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[_buildText("All"), Spacer(), _buildText("Done")],
        ),
        Container(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildButton(Icons.radio_button_checked),
            _buildButton(Icons.home),
            _buildButton(Icons.settings),
          ],
        )
      ],
    );
  }

  Widget _buildBottomCard(double width, double height) {
    return Container(
      width: width,
      height: height / 3,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      child: _buildBottomCardChildren(),
    );
  }

  Widget _buildItemCardChild(CursoMedia item) {
    return Column(
      children: <Widget>[
        Text(
          item.curso.toUpperCase(),
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20,),
        Text(
          item.mediaMinima.toString(),
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20,),
        Text(
          item.suaMedia.toString(),
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),


      ],

    );
  }

  Widget _buildItemCard(CursoMedia item) {
    return GestureDetector(
        onTap: () => _onTapItem(context, item),
       child: Container(
          width: 130,
          height: 145,
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)]),
          child: _buildItemCardChild(item),

        )
    );

  }


  Widget _buildCardsList(items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items.elementAt(index);
        return _buildItemCard(item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(pessoa.nome);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[300],
        title: _buildTitle(),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
      body: FutureBuilder<List<CursoMedia>>(
        future: fetchcursos(http.Client(),pessoa.nome),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Stack(
                    children: <Widget>[
                      _buildCardsList(snapshot.data),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
void _onTapItem(BuildContext context, CursoMedia curso) {
//  Scaffold
//      .of(context)
//      .showSnackBar(new SnackBar(content: new Text(curso.id.toString() + ' - ' + curso.nome)));
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>DetailPage())
  );
}


