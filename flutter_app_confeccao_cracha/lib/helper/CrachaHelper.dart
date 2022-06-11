import 'package:confeccao_cracha/model/Cracha.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class CrachaHelper {
  static final String nomeTabela = "cracha";
 
  static final CrachaHelper _crachaHelper = CrachaHelper._internal();
  Database _db;
 
  factory CrachaHelper() {
    return _crachaHelper;
  }
 
  CrachaHelper._internal() {}
 
  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }
 
  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "nome VARCHAR, "
        "area VARCHAR, "
        "foto VARCHAR)";
    await db.execute(sql);
  }
 
  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "banco_meu_crachas.db");
 
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }
 
  Future<int> salvarCracha(Cracha cracha) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, cracha.toMap());
    return resultado;
  }
 
  recuperarCrachas() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY id asc ";
    List crachas = await bancoDados.rawQuery(sql);
    return crachas;
  }
 
  Future<int> atualizarCracha(Cracha cracha) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, cracha.toMap(),
        where: "id = ?", whereArgs: [cracha.id]);
  }
 
  Future<int> removerCracha(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
