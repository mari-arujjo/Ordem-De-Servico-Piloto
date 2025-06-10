import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/pages/atendimento/atendimento_page.dart';
import 'package:ordem_de_servico/app/UI/pages/gestao_usuarios/gestao_usuarios_page.dart';
import 'package:ordem_de_servico/app/UI/pages/home_page.dart';
import 'package:ordem_de_servico/app/UI/pages/login_page.dart';
import 'package:ordem_de_servico/app/UI/pages/manutencao/manutencao_page.dart';
import 'package:ordem_de_servico/app/UI/pages/meu_perfil_page.dart';
import 'package:ordem_de_servico/app/UI/pages/ordem_os/ordem_os_page.dart';

final GoRouter rotas = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: '/meuPerfil',
      builder: (context, state) => const MeuPerfilPage(),
    ),

    GoRoute(
      path: '/atendimento',
      builder: (context, state) => const AtendimentoPage(),
    ),

    GoRoute(
      path: '/manutencao',
      builder: (context, state) => const ManutencaoPage(),
    ),

    GoRoute(
      path: '/ordemOS',
      builder: (context, state) => const OrdemOsPage(),
    ),

    GoRoute(
      path: '/gestaoUsuarios',
      builder: (context, state) => const GestaoUsuariosPage(),
    ),

  ],
);