import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/pages/atendimento/atendimento_page.dart';
import 'package:ordem_de_servico/UI/pages/atendimento/fornecedores/cadastro_fornecedor_page.dart';
import 'package:ordem_de_servico/UI/pages/atendimento/fornecedores/fornecedor_page.dart';
import 'package:ordem_de_servico/UI/pages/atendimento/fornecedores/gestao_fornecedores_page.dart';
import 'package:ordem_de_servico/UI/pages/gestao_usuarios/cadastro_user_page.dart';
import 'package:ordem_de_servico/UI/pages/gestao_usuarios/gestao_usuarios_page.dart';
import 'package:ordem_de_servico/UI/pages/gestao_usuarios/usuario_page.dart';
import 'package:ordem_de_servico/UI/pages/principais/configuracoes_page.dart';
import 'package:ordem_de_servico/UI/pages/principais/home_page.dart';
import 'package:ordem_de_servico/UI/pages/principais/historico_page.dart';
import 'package:ordem_de_servico/UI/pages/principais/login_page.dart';
import 'package:ordem_de_servico/UI/pages/manutencao/manutencao_page.dart';
import 'package:ordem_de_servico/UI/pages/ordem_os/ordem_os_page.dart';
import 'package:ordem_de_servico/UI/pages/principais/sem_perfil_page.dart';
import 'package:ordem_de_servico/base/navigation.dart';

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
                  GoRoute(
                    path: '/configuracoes',
                    name: 'configuracoes',
                    builder: (context, state) {
                      return ConfiguracoesPage(key: state.pageKey);
                    },
                  ),

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
                            path: '/fornecedor/:id',
                            name: 'fornecedorDetalhe',
                            builder: (context, state) {
                              final id = int.parse(state.pathParameters['id']!);
                              return FornecedorPage(key: state.pageKey, idUsuario: id);
                            },
                          ),
                          GoRoute(
                            path: '/cadastroFornecedor',
                            name: 'cadastroFornecedor',
                            builder: (context, state) {
                              return CadastroFornecedorPage(key: state.pageKey);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  GoRoute(
                    path: '/manutencao',
                    name: 'manutencao',
                    builder: (context, state) {
                      return ManutencaoPage(key: state.pageKey);
                    },
                  ),

                  GoRoute(
                    path: '/ordemOS',
                    name: 'ordemOS',
                    builder: (context, state) {
                      return OrdemOsPage(key: state.pageKey);
                    },
                  ),

                  GoRoute(
                    path: '/gestaoUsuarios',
                    name: 'gestaoUsuarios',
                    builder: (context, state) {
                      return GestaoUsuariosPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: '/usuario/:id',
                        name: 'usuarioDetalhe',
                        builder: (context, state) {
                          final id = int.parse(state.pathParameters['id']!);
                          return UsuarioPage(key: state.pageKey, idUsuario: id);
                        },
                        routes: [
                          GoRoute(
                            path: '/historico',
                            name: 'usuarioHistorico',
                            builder: (context, state) {
                              final id = int.parse(state.pathParameters['id']!);
                              return HistoricoPage(
                                key: state.pageKey,
                                idUsuario: id,
                              );
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        path: '/cadastroUsuario',
                        name: 'cadastroUsuario',
                        builder: (context, state) {
                          return CadastroUserPage(key: state.pageKey);
                        },
                      ),
                    ],
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
                  return SemPerfilPage(key: state.pageKey);
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
