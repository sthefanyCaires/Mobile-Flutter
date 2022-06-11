import 'package:lista_de_tarefas/model/Tarefa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class TarefaHelper {
  static final String nomeTabela = "tarefa";
 
  static final TarefaHelper _tarefaHelper = TarefaHelper._internal();
  Database _db;
 
  factory TarefaHelper() {
    return _tarefaHelper;
  }
 
  TarefaHelper._internal() {}
 
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
        "titulo VARCHAR)";
    await db.execute(sql);
  }
 
  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "banco_minhas_tarefas.db");
 
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }
 
  Future<int> salvarTarefa(Tarefa tarefa) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, tarefa.toMap());
    return resultado;
  }
 
  recuperarTarefas() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY id asc ";
    List tarefas = await bancoDados.rawQuery(sql);
    return tarefas;
  }
 
  Future<int> atualizarTarefa(Tarefa tarefa) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, tarefa.toMap(),
        where: "id = ?", whereArgs: [tarefa.id]);
  }
 
  Future<int> removerTarefa(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
