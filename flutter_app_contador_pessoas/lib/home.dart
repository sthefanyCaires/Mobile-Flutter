import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _counter = 0;

  void _incrementCounter() {
    setState(() {
        _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if(_counter > 0){
        _counter--;
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
      title: Text("Contador de Pessoas"),
      centerTitle: true,
      backgroundColor: Colors.orange,
    );
  }

  _corpo() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
      child: Container (
      margin: const EdgeInsets.only(right: 45.0, left: 45.0,),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _texto(),
            Row(
          children:<Widget> [            
            _botaosoma(),
            _botaosub(), 
            ],)         
          ]),
      ),
    );
  }


  _botaosoma() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container (
      margin: const EdgeInsets.only(right: 50.0,),
      child: Container(
        height: 100.0,
        width: 100.0,
        child: RaisedButton(
          onPressed: _incrementCounter,
          child: Text("+",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.green,
        ),
      ),
      ),
    );
  }

  _botaosub() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 100.0,
        width: 100.0,
        child: RaisedButton(
          onPressed: _decrementCounter,
          child: Text("-",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.red,
        ),
      ),
    );
  }

  _texto() {
        return Container(

      child: Column(
          children: <Widget>[
             Card(
              color: Colors.white, 
              child: Container(
                padding: EdgeInsets.all(70),
                height: 200.0,
                child: Text("$_counter",
                style:  TextStyle(color: Colors.red, fontSize: 50.0)),
                color: Colors.white,
                ),
              ),
          ],
        ),
    );
  }
}
