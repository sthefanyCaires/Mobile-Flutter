import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lista_de_tarefas/helper/TarefaHelper.dart';
import 'package:lista_de_tarefas/model/Tarefa.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  var _db = TarefaHelper();
  List<Tarefa> _tarefas = List<Tarefa>();
 
  _exibirTelaCadastro({Tarefa tarefa}) {
    String textoSalvarAtualizar = "";
    if (tarefa == null) {
      //salvando
      _tituloController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _tituloController.text = tarefa.titulo;
      textoSalvarAtualizar = "Atualizar";
    }
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar tarefa"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Título", hintText: "Digite título..."),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarTarefa(tarefaSelecionada: tarefa);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarTarefas() async {
    List tarefasRecuperadas = await _db.recuperarTarefas();
 
    List<Tarefa> listaTemporaria = List<Tarefa>();
    for (var item in tarefasRecuperadas) {
      Tarefa tarefa = Tarefa.fromMap(item);
      listaTemporaria.add(tarefa);
    }
 
    setState(() {
      _tarefas = listaTemporaria;
    });
    listaTemporaria = null;
 
    //print("Lista anotacoes: " + tarefasRecuperadas.toString() );
  }
 
  _salvarAtualizarTarefa({Tarefa tarefaSelecionada}) async {
    String titulo = _tituloController.text;
 
    if (tarefaSelecionada == null) {
      //salvar
      Tarefa tarefa =
          Tarefa(titulo);
      int resultado = await _db.salvarTarefa(tarefa);
    } else {
      //atualizar
      tarefaSelecionada.titulo = titulo;
      tarefaSelecionada.data = DateTime.now().toString();
      int resultado = await _db.atualizarTarefa(tarefaSelecionada);
    }
 
    _tituloController.clear();
 
    _recuperarTarefas();
  }
 
  _formatarData(String data) {
    initializeDateFormatting("pt_BR");
 
    //Year -> y month-> M Day -> d
    // Hour -> H minute -> m second -> s
    //var formatador = DateFormat("d/MMMM/y H:m:s");
    var formatador = DateFormat.yMd("pt_BR");
 
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
 
    return dataFormatada;
  }
 
  _removerTarefa(int id) async {
    await _db.removerTarefa(id);
 
    _recuperarTarefas();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarTarefas();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = _tarefas[index];
 
                    return Card(
                      child: ListTile(
                        title: Text(tarefa.titulo),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(tarefa: tarefa);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerTarefa(tarefa.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
