import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/pages/atendimento/atendimento_page.dart';
import 'package:ordem_de_servico/pages/fornecedores/cadastro_fornecedor_page.dart';
import 'package:ordem_de_servico/pages/fornecedores/fornecedor_page.dart';
import 'package:ordem_de_servico/pages/fornecedores/gestao_fornecedores_page.dart';
import 'package:ordem_de_servico/pages/principais/configuracoes_page.dart';
import 'package:ordem_de_servico/pages/principais/home_page.dart';
import 'package:ordem_de_servico/pages/principais/login_page.dart';
import 'package:ordem_de_servico/pages/manutencao/manutencao_page.dart';
import 'package:ordem_de_servico/pages/ordem_os/ordem_os_page.dart';
import 'package:ordem_de_servico/pages/principais/meu_perfil_page.dart';
import 'package:ordem_de_servico/navigation.dart';

class AppNavigation {
  AppNavigation._();
  static String initR = '/home';

  /// KEYS DE NAVEGAÇÃO
  /// navegação global raiz do app, serve para navegar em telas fora da estrutura do shell, como:
  /// tela de login, splash screen e pags que nao fazem parte da navegação por abas
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  /// navegadores independentes, usados por cada StatefulShellBranch.
  /// mantém pilhas de navegação separadas
  static final _rootNavigatorHome = GlobalKey<NavigatorState>(
    debugLabel: 'shellHome',
  );
  static final _rootNavigatorPerfil = GlobalKey<NavigatorState>(
    debugLabel: 'shellPerfil',
  );

  static final GoRouter rotas = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: initR,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      ///MainNavigation route
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationBarWidget(navigationShell: navigationShell);
        },

        branches: <StatefulShellBranch>[
          /// Branch -> HOME
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                path: '/home',
                name: 'Home',
                builder: (context, state) {
                  return HomePage(key: state.pageKey);
                },
                routes: [
                  /// CONFIGURAÇÕES
                  GoRoute(
                    path: '/configuracoes',
                    name: 'configuracoes',
                    builder: (context, state) {
                      return ConfiguracoesPage(key: state.pageKey);
                    },
                  ),

                  /// ATENIDMENTO
                  GoRoute(
                    path: '/atendimento',
                    name: 'atendimento',
                    builder: (context, state) {
                      return AtendimentoPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: '/gestaoFornecedores',
                        name: 'gestaoFornecedores',
                        builder: (context, state) {
                          return GestaoFornecedoresPage(key: state.pageKey);
                        },
                        routes: [
                          GoRoute(
                            path: '/cadastroFornecedor',
                            name: 'cadastroFornecedor',
                            builder: (context, state) {
                              return CadastroFornecedorPage(key: state.pageKey);
                            },
                          ),
                          GoRoute(
                            path: '/fornecedor/:id',
                            name: 'fornecedorDetalhe',
                            builder: (context, state) {
                              final id = int.parse(state.pathParameters['id']!);
                              return FornecedorPage(
                                key: state.pageKey,
                                idFornecedor: id,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// MANUTENÇÃO
                  GoRoute(
                    path: '/manutencao',
                    name: 'manutencao',
                    builder: (context, state) {
                      return ManutencaoPage(key: state.pageKey);
                    },
                  ),

                  /// ORDEM OS
                  GoRoute(
                    path: '/ordemOS',
                    name: 'ordemOS',
                    builder: (context, state) {
                      return OrdemOsPage(key: state.pageKey);
                    },
                  ),

                  
                ],
              ),
            ],
          ),

          /// Branch -> PERFIL
          StatefulShellBranch(
            navigatorKey: _rootNavigatorPerfil,
            routes: [
              GoRoute(
                path: '/perfil',
                name: 'Perfil',
                builder: (context, state) {
                  return MeuPerfilPage(key: state.pageKey);
                },
              ),
            ],
          ),
        ],
      ),

      // Login route
      GoRoute(
        path: '/login',
        name: 'Login',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          return LoginPage(key: state.pageKey);
        },
      ),
    ],
  );
}
