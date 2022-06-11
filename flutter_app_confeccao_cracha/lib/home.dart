import 'dart:io';
import 'package:confeccao_cracha/helper/CrachaHelper.dart';
import 'package:confeccao_cracha/model/Cracha.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  TextEditingController _nomeController = TextEditingController();
  String dropdownValor = 'Tecnologia';
  File file;
  String path_foto = 'Tire uma foto';
  var _db = CrachaHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criação de crachá"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            file != null
                ? Image.file(file, height: 150, width: 150,)
                : Image.asset(
                    "assets/images/camera.png",
                    height: 50,
                  ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'Câmera',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      _getImagemFromCamera();
                  }),
                  SizedBox(
                    width: 60,
                  ),
                  RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'Galeria',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      _getImagemFromGaleria();
                  }),
                ],
              ),
            ),
            TextField(
              controller: _nomeController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Nome", hintText: "Digite o nome..."),
            ),
            DropdownButton<String>(
              value: dropdownValor,
              items: <String>['Tecnologia', 'RH', 'Suporte', 'Design']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String valorSelecionado) {
                setState(() {
                  dropdownValor = valorSelecionado;
                });
              },
            ),
             RaisedButton(
              color: Colors.green,
              child: Text(
                'Salvar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                _salvarCracha();
            }),
          ],
        ),
      ),
    );
  }

  _salvarCracha() async {
    String nome = _nomeController.text;
    String area = dropdownValor;
    String foto = path_foto;
 
    Cracha cracha = Cracha(nome, area, foto);
    int resultado = await _db.salvarCracha(cracha);
    
    _recuperarCracha();
  }

  _recuperarCracha() async {
    List crachasRecuperados = await _db.recuperarCrachas();
 
    for (var cracha in crachasRecuperados) {
       print("cracha id: " +
          cracha['id'].toString() +
          " nome: " +
          cracha['nome'] +
          " área: " +
          cracha['area'] +
          " foto: " +
          cracha['foto']);

    }
 
 
  }
 
  void _getImagemFromCamera() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.camera);
 
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }
 
  void _getImagemFromGaleria() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.gallery);
 
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }
}
