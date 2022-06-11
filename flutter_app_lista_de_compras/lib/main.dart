import 'package:flutter/material.dart';
import 'package:lista_de_compras/Home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
