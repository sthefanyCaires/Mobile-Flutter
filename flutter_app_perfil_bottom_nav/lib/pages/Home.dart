import 'package:flutter/material.dart';
import 'package:perfil_bottom_nav/pages/Experiencia.dart';
import 'package:perfil_bottom_nav/pages/Formacao.dart';
import 'Sobre.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int _currentIndex = 0;
 
  final tabs = [
    Center(child: Text('Tela Home')),
    Sobre(),
    Formacao(),
    Experiencia(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _currentIndex == 0? _corpo():tabs[_currentIndex],
        bottomNavigationBar: _nav_var()
      ),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Sthefany"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }
 
  _corpo() {
    return Container(
      margin: EdgeInsets.only(top: 150, bottom: 20),
      child: ListView(
        children: <Widget>[
          _descricao(
            'Seja bem-vindo',
            'Me chamo Sthefany'        
          ),
        ],
      ),
    );
  }
 
  _texto(texto) {
    return Text(
      texto,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _descricao(titulo, descricao1) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _texto(titulo),
            _texto(descricao1),
          ],
        ),
      ),
    );
  }
 

  _botao_navigation(titulo, icone){
    return BottomNavigationBarItem(
              icon: Icon(icone),
              label: titulo,
            );
  }

  _nav_var(){
    return BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            _botao_navigation('Home', Icons.home),
            _botao_navigation('Sobre', Icons.accessibility_outlined),
            _botao_navigation('Formação', Icons.cast_for_education),
            _botao_navigation('Experiência', Icons.expand_circle_down_outlined)
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        );
  }
 
  _onClickNavegacao(BuildContext context, Widget tela) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return tela;
      }),
    );
  }
}
