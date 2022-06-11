import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController usuarioController = TextEditingController();
  String infoUsuario = '';
  String fotoUsuario = 'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png';
 
  _recuperarCep() async {
    String url = 'https://api.github.com/users/${usuarioController.text}';
 
    print(url);
 
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    int id = retorno["id"];
    String nome = retorno["name"];
    int repositorios = retorno["public_repos"];
    String criadoEm = retorno["created_at"];
    int seguidores = retorno["followers"];
    int seguindo = retorno["following"];
    String foto = retorno["avatar_url"];
 
    setState(() {
      infoUsuario = "Id: $id \n Nome: $nome \n Repositórios: $repositorios \n Criado em: $criadoEm \n Seguidores: $seguidores \n Seguindo: $seguindo";
      fotoUsuario = foto;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil dos Devs"),
      ),
      body: _corpo(),
    );
  }

  _corpo() {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _foto(fotoUsuario),
            _campo('Digite o usuário', usuarioController),
            _botao(),
            Text(infoUsuario),
          ],
        ),
      );
  }

  _campo(labelTitulo, objController){
    return TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: labelTitulo,
                  labelStyle: TextStyle(color: Colors.green)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: objController,
            );
  }

  _botao(){
    return Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _recuperarCep,
                  child: Text("Obter usuário",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.blue,
                ),
              ),
            );
  }

  _foto(url) {
    return Center(
      child: Image.network(
        url,
        height: 200,
        width: 200),
    );
  }
}
