import 'package:lista_de_compras/model/Mercadoria.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class MercadoriaHelper {
  static final String nomeTabela = "mercadoria";
 
  static final MercadoriaHelper _mercadoriaHelper = MercadoriaHelper._internal();
  Database _db;
 
  factory MercadoriaHelper() {
    return _mercadoriaHelper;
  }
 
  MercadoriaHelper._internal() {}
 
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
        "quantidade INTEGER)";
    await db.execute(sql);
  }
 
  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "banco_minhas_compras.db");
 
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }
 
  Future<int> salvarMercadoria(Mercadoria mercadoria) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, mercadoria.toMap());
    return resultado;
  }
 
  recuperarMercadorias() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY id asc";
    List mercadorias = await bancoDados.rawQuery(sql);
    return mercadorias;
  }
 
  Future<int> atualizarMercadoria(Mercadoria mercadoria) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, mercadoria.toMap(),
        where: "id = ?", whereArgs: [mercadoria.id]);
  }
 
  Future<int> removerMercadoria(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
