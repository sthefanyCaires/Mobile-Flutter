import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_compras/helper/MercadoriaHelper.dart';
import 'package:lista_de_compras/model/Mercadoria.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();
  var _db = MercadoriaHelper();
  List<Mercadoria> _mercadorias = List<Mercadoria>();
 
  _exibirTelaCadastro({Mercadoria mercadoria}) {
    String textoSalvarAtualizar = "";
    if (mercadoria == null) {
      //salvando
      _nomeController.text = "";
      _quantidadeController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _nomeController.text = mercadoria.nome;
      _quantidadeController.text = "$mercadoria.quantidade";
      textoSalvarAtualizar = "Atualizar";
    }
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar mercadoria"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _nomeController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Título", hintText: "Digite título..."),
                ),
                TextField(
                  controller: _quantidadeController,
                  decoration: InputDecoration(
                      labelText: "Quantidade", hintText: "Digite a quantidade..."),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarMercadoria(mercadoriaSelecionada: mercadoria);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarMercadorias() async {
    List mercadoriasRecuperadas = await _db.recuperarMercadorias();
 
    List<Mercadoria> listaTemporaria = List<Mercadoria>();
    for (var item in mercadoriasRecuperadas) {
      Mercadoria mercadoria = Mercadoria.fromMap(item);
      listaTemporaria.add(mercadoria);
    }
 
    setState(() {
      _mercadorias = listaTemporaria;
    });
    listaTemporaria = null;
 
    //print("Lista mercadorias: " + mercadoriasRecuperadas.toString() );
  }
 
  _salvarAtualizarMercadoria({Mercadoria mercadoriaSelecionada}) async {
    String nome = _nomeController.text;
    int qtd = int.parse(_quantidadeController.text);
 
    if (mercadoriaSelecionada == null) {
      //salvar
      Mercadoria mercadoria =
          Mercadoria(nome, qtd);
      int resultado = await _db.salvarMercadoria(mercadoria);
    } else {
      //atualizar
      mercadoriaSelecionada.nome = nome;
      mercadoriaSelecionada.quantidade = qtd;
      int resultado = await _db.atualizarMercadoria(mercadoriaSelecionada);
    }
 
    _nomeController.clear();
    _quantidadeController.clear();
 
    _recuperarMercadorias();
  }
 
  _removerMercadoria(int id) async {
    await _db.removerMercadoria(id);
 
    _recuperarMercadorias();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarMercadorias();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Lista de compras"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _mercadorias.length,
                  itemBuilder: (context, index) {
                    final mercadoria = _mercadorias[index];
 
                    return Card(
                      child: ListTile(
                        title: Text("${(mercadoria.nome)} - (${mercadoria.quantidade})"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(mercadoria: mercadoria);
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
                                _removerMercadoria(mercadoria.id);
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
