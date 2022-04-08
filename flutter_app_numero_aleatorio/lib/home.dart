import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

   String infoResultado = '';

  void _numeroAleatorio() {
    setState(() {
      int palpite = int.parse(n1Controller.text);
      int numero = new Random().nextInt(11);

      if(palpite == numero) {
        infoResultado = "Você acertou! Parabéns 🥳";
      }
      else{
        infoResultado = "Você errou! A resposta era $numero 😔";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Jogo do N° Aleatório"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: Image.network(
                    'https://img.freepik.com/vetores-gratis/ilustracao-de-pessoas-planas-organicas-fazendo-perguntas_23-2148906283.jpg?t=st=1649355878~exp=1649356478~hmac=d0ef38ed2d0e51e7d6945ecfa5b8ff646712fb0201fccbd2406d39fc0d8f0e3e&w=740',
                    height: 260,
                    width: 260,
                )
            ),
            _campo("Pense em um n° de 0 a 10", n1Controller),
            _botao(),
            _texto(infoResultado),
          ]),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: objController,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _numeroAleatorio,
          child: Text("Descobrir",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blue,
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Padding(
  padding: EdgeInsets.only(bottom: 22, top: 22,), //apply padding to all four sides
  child: Text(     
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 25.0,
        ),
        ),
    );
  }
}
