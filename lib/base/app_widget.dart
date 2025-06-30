import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordem_de_servico/base/rotas.dart';

class AppWidget extends StatelessWidget {
	// construtor
  const AppWidget({super.key});

	// método que constrói a tela
  @override
  Widget build(BuildContext context) {

      return MaterialApp.router(
      title: 'OS Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          foregroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),

        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme
        ),
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2C2C2C)),
      ),

      routerConfig: AppNavigation.rotas,
    );
  }
}