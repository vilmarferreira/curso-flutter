import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste_app/pessoa.dart';


class DbHelper {
  static final DbHelper _instance = new DbHelper.internal();

  factory DbHelper() => _instance;

  final String tabelaDadosPessoais = "tabelaDadosPessoais";
  final String dadosPessoaisId = "id";

  //Nome da propriedade
  final String nome = "nome";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initBd();
    return _db;
  }

  DbHelper.internal();

  initBd() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String caminho = join(documentoDiretorio.path,
        "farm100.db"); // home://directory/files/bd_principal.db

    var nossoBD = await openDatabase(caminho, version: 1, onCreate: _onCreate);
    return nossoBD;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $tabelaDadosPessoais($dadosPessoaisId INTEGER PRIMARY KEY,"
        "$nome TEXT,");

    }

  //INSERIR
  Future<int> saveFarm(Pessoa pessoa) async {
    var bdCliente = await db;
    int res = await bdCliente.insert("$tabelaDadosPessoais", pessoa.toMap());
    print(res.toString());
    return res;
  }

}


