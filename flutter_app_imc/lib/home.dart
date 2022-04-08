import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

  String infoResultado = "Classificação";

  void _calcularIMC() {
    setState(() {
      double peso = double.parse(n1Controller.text);
      double altura = double.parse(n2Controller.text);

      double imc = peso / (altura * altura);

      if (imc < 18.5) {

        infoResultado = "Classificação = Abaixo do peso";

      } else if (imc > 18.5 && imc < 24.9) {

        infoResultado = "Classificação = Peso Ideal";

      } else if (imc > 25 && imc < 29.9) {

        infoResultado = "Classificação = Sobrepeso";

      } else if (imc > 30 && imc < 34.9) {

        infoResultado = "Classificação = Obesidade Grau 1";

      } else if (imc > 35 && imc < 39.9) {

        infoResultado = "Classificação = Obesidade Grau 2";

      } else if (imc >= 40) {

        infoResultado = "Classificação = Obesidade Mórbida";

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
      title: Text("Cálculo do IMC"),
      centerTitle: true,
      backgroundColor: Colors.green,
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
                    'https://www.canalspatz.com.br/wp-content/uploads/2019/11/IMAGEM-DESTAQUE-BLOG-INFOGRAFICO-SPATZ.png',
                    height: 260,
                    width: 260,
                )
            ),
            _campo("Peso", n1Controller),
            _campo("Altura", n2Controller),
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
          onPressed: _calcularIMC,
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.green,
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Padding(
  padding: EdgeInsets.only(bottom: 12), //apply padding to all four sides
  child: Text(     
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.green,
        fontSize: 25.0,
        ),
        ),
    );
  }
}
