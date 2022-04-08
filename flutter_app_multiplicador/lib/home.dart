import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home ({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    TextEditingController n1Controller = TextEditingController();
    TextEditingController n2Controller = TextEditingController();

    String infoResultado = "Informe os números!";

    void _calcularSoma() {
      setState(() {
        double n1 = double.parse(n1Controller.text);
        double n2 = double.parse(n2Controller.text);

        double resultado = n1 * n2;

        infoResultado = 'Resultado: $resultado';
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
    return AppBar (
      title: Text("Multiplicador de Números"),
      centerTitle: true,
      backgroundColor: Colors.orange,
    );
  }
  
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          _campo("Digite o primeiro n°", n1Controller),
          _campo("Digite o segundo n°", n2Controller),
          _botao(),
          _texto(infoResultado),
        ]
      ),
    );
  }
  
  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration (
        labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 25.0),
        controller: objController,
    );
  }
  
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container (
        height: 50.0,
        child: RaisedButton (
          onPressed: _calcularSoma,
          child: Text("Calcular",
            style: TextStyle(color: Colors.black, fontSize: 20.0)),
          color: Colors.blue,
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text (
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
    );
  }
  }