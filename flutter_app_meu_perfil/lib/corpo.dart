// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class widget_home extends StatelessWidget {
  const widget_home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar (
      title: const Text("Meu Perfil"),
      centerTitle: true,
      ),
        body: Container (
          color: Colors.white,
            child: const Text (
              "\n"
              "Dados Pessoais:\n"
              "Nome: Sthefany Aparecida Caires Cordeiro\n"
              "Data de nascimento: 18/06/2002\n"
              "Celular: (13) 98176-4600\n"
              "______________________________________\n"
              "\n"
              "Formação: Análise e Desenvolvimento de Sistemas - FATEC Praia Grande\n"
              "______________________________________\n"
              "\n"
              "Experiências:\n"
              "Santos Port Authority\n"
              " • Estágio - Suporte de TI\n"
              " • Estágio - Desenvolvimento\n"
              "______________________________________\n"
              "\n"
              "Projetos realizados:\n"
              " • Pataforma\n"
              " • IAFEI\n"
              " • vegthais\n"
              " • buscafarma\n",
              style: TextStyle (
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationColor: Colors.cyan,
                decorationStyle: TextDecorationStyle.solid,
              ),
          ),
        ),
    );
  }
}
