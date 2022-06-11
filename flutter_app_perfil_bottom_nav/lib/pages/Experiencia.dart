import 'package:flutter/material.dart';
 
class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);
 
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
            'Estagiária de Suporte de TI - Santos Port Authority',
            'Estagiária de Desenvolvimento Santos Port Authority',        
            'Estagiária de UX/UI Design - Chuva Inc.'        
          ),
        ],
      ),
    );
  }

  _descricao(titulo, descricao1, descricao2) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _texto(titulo),
            _texto(descricao1),
            _texto(descricao2),
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
