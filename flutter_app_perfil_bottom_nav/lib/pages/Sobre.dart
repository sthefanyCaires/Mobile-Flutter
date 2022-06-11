import 'package:flutter/material.dart';
 
class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100, bottom: 20),
      child: ListView(
        children: <Widget>[
          _descricao(
            'Tenho 19 anos',
            'Nasci no Guarujá',        
            'Moro em Praia Grande',        
            'Gosto de livros e jogos'        
          ),
        ],
      ),
    );
  }

  _descricao(titulo, descricao1, descricao2, descricao3) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _texto(titulo),
            _texto(descricao1),
            _texto(descricao2),
            _texto(descricao3),
          ],
        ),
      ),
    );
  }

  _texto(texto) {
    return Text(
      texto,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
