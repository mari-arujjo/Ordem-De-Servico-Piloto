import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordem_de_servico/app/UI/pages/home_page.dart';

class AppWidget extends StatelessWidget {
	// construtor
  const AppWidget({super.key});

	// método que constrói a tela
  @override
  Widget build(BuildContext context) {
  
	  // retorna um app baseado no Material Design, que é o visual padrão do Android
    return MaterialApp(
      title: 'OS Demo', //nome do ap
      debugShowCheckedModeBanner: false,
      
      //cores tema do app
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2C2C2C)),
      ),
      
      //define a tela de inicialização e o título dela
      home: const HomePage(title: null,),
    );
  }
}