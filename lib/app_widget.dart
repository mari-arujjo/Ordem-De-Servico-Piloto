import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/pages/home_page.dart';

class AppWidget extends StatelessWidget {
	// construtor
  const AppWidget({super.key});

	// método que constrói a tela
  @override
  Widget build(BuildContext context) {
  
	  // retorna um app baseado no Material Design, que é o visual padrão do Android
    return MaterialApp(
      title: 'OS Demo', //nome do app
      
      //cores tema do app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      
      //define a tela de inicialização e o título dela
      home: const HomePage(title: null,),
    );
  }
}