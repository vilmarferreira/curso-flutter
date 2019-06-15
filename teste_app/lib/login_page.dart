import 'package:flutter/material.dart';
import 'package:teste_app/listposts.dart';
import 'package:teste_app/pessoa.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nomeController = new TextEditingController();
  String nome;

  void goToListView() async {
    Pessoa pessoa = new Pessoa();
    pessoa.nome = nomeController.text;

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>ListViewcursos(pessoa: pessoa))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      floatingActionButton: FloatingActionButton(
        onPressed: goToListView,
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.only(
            top:60,
            left: 40,
            right: 40
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              controller: nomeController,
              onChanged: (val) => nome = val,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(

              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text("Recuperar senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: (){},
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  stops: [0.3 , 1],
                  colors: [
                    Color(0xFFF58524),
                    Color(0xFFF92b7F),
                  ],
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(5)
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/bone.png"),
                          height: 28,
                          width: 28,
                        ),
                      ),

                    ],
                  ),
                  onPressed: (){},
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: Color(0xFF3c5a99),
                borderRadius: BorderRadius.all(
                    Radius.circular(5)
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Login com Facebook",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/fb-icon.png"),
                          height: 28,
                          width: 28,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),


                    ],
                  ),
                  onPressed: (){},
                ),
              ),
            ),
            Container(
              height: 30,
              child: FlatButton(
                child: Text(
                  "Cadastrar-se",
                  textAlign: TextAlign.center,
                ),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
