import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordem_de_servico/app/UI/pages/atendimento/atendimento_page.dart';
import 'package:ordem_de_servico/app/UI/pages/gestao_usuarios/gestao_usuarios_page.dart';
import 'package:ordem_de_servico/app/UI/pages/home_page.dart';
import 'package:ordem_de_servico/app/UI/pages/login_page.dart';
import 'package:ordem_de_servico/app/UI/pages/manutencao/manutencao_page.dart';
import 'package:ordem_de_servico/app/UI/pages/meu_perfil_page.dart';
import 'package:ordem_de_servico/app/UI/pages/ordem_os/ordem_os_page.dart';

class AppWidget extends StatelessWidget {
	// construtor
  const AppWidget({super.key});

	// método que constrói a tela
  @override
  Widget build(BuildContext context) {
  
	  // retorna um app baseado no Material Design, que é o visual padrão do Android
    return MaterialApp(
      title: 'OS Demo', //nome do ap
      debugShowCheckedModeBanner: true,
      
      //cores tema do app
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2C2C2C)),
      ),

      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/login': (_) => LoginPage(),
        '/meuPerfil': (_) => MeuPerfilPage(),
        
        '/gestaoUsuarios': (_) => GestaoUsuariosPage(),
        '/atendimento': (_) => AtendimentoPage(),
        '/manutencao': (_) => ManutencaoPage(),     
        '/ordemOs': (_) => OrdemOsPage(),     
        },
    );
  }
}