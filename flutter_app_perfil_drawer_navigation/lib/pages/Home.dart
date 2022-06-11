import 'package:flutter/material.dart';
import 'Sobre.dart';
import 'Experiencia.dart';
import 'Formacao.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int _currentPage = 0;
 
  final telas = [
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
        body: _currentPage == 0? _corpo():telas[_currentPage],
        drawer: _drawer(),
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
  
    _drawer() {
    return Drawer(
          child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(' Sthefany Caires'),
              accountEmail: Text('sthefanyacc2@hotmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sthe.jpg'),
              ),
            ),
            _list_tile('Pessoal', 'Sobre mim', Icons.account_box_outlined, 1),
            _list_tile('Formação', 'histórico acadêmico', Icons.contact_mail_rounded, 2),
            _list_tile('Experiência', 'Histórico no mercado de trabalho', Icons.contact_mail_rounded, 3)
          ],
        ));
  }

  _list_tile(titulo, subtitulo, icone, pagina){
    return ListTile(
              //leading: Icon(Icons.star),
              title: Text(titulo),
              subtitle: Text(subtitulo),
              trailing: Icon(icone),
              onTap: () {
                setState(() {
                  _currentPage = pagina;
                });
              },
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

}
