import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home ({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    TextEditingController n1Controller = TextEditingController();
    TextEditingController n2Controller = TextEditingController();

    String infoResultado = "Resultado";

    void _calcularDivisao() {
      setState(() {
        double precoAlcool = double.parse(n1Controller.text);
        double precoGasolina = double.parse(n2Controller.text);

        double resultado =  precoGasolina / precoAlcool;

        if(resultado > 0.7) {
          infoResultado = 'A gasolina é o melhor para abastecer.';
        }
        else {
          infoResultado = 'O álcool é o melhor para abastecer.';  
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
    return AppBar (
      title: Text("Álcool ou Gasolina"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }
  
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container(
            width: 200,
            height: 200,
          child: Image.network(
            'https://complemento.veja.abril.com.br/economia/calculadora-combustivel/img/abre.jpg')
          ),
          _campo("Preço do Álcool", n1Controller),
          _campo("Preço da Gasolina", n2Controller),
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
          onPressed: _calcularDivisao,
          child: Text("Verificar",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.green,
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text (
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0,),
    );
  }
  }