import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordem_de_servico/rotas.dart';

class AppWidget extends StatelessWidget {
	// construtor
  const AppWidget({super.key});

	// método que constrói a tela
  @override
  Widget build(BuildContext context) {
      return MaterialApp.router(
      title: 'OS Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2C2C2C)),
      ),

      routerDelegate: rotas.routerDelegate,
      routeInformationParser: rotas.routeInformationParser,
      routeInformationProvider: rotas.routeInformationProvider,
    );
  }
}