import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/pages/home_page.dart';
import 'package:ordem_de_servico/app/UI/pages/login_page.dart';
import 'package:ordem_de_servico/app/UI/pages/meu_perfil_page.dart';

final rotas = GoRouter(
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
  ],
);