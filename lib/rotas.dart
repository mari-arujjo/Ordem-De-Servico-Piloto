import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/pages/atendimento/atendimento_page.dart';
import 'package:ordem_de_servico/pages/configuracoes_page.dart';
import 'package:ordem_de_servico/pages/fornecedores/cadastro_fornecedor_page.dart';
import 'package:ordem_de_servico/pages/fornecedores/fornecedor_page.dart';
import 'package:ordem_de_servico/pages/fornecedores/gestao_fornecedores_page.dart';
import 'package:ordem_de_servico/pages/gestao%20usuarios/cadastro_user_page.dart';
import 'package:ordem_de_servico/pages/gestao%20usuarios/gestao_user_page.dart';
import 'package:ordem_de_servico/pages/login_page.dart';
import 'package:ordem_de_servico/pages/manutencao/manutencao_page.dart';
import 'package:ordem_de_servico/pages/meu_perfil_page.dart';
import 'package:ordem_de_servico/pages/ordem_os/ordem_os_page.dart';
import 'package:ordem_de_servico/navigation.dart';
import 'package:ordem_de_servico/pages/tema_page.dart';

class AppNavigation {
  AppNavigation._();
  static String initR = '/ordemOS';

  /// KEYS DE NAVEGAÇÃO
  /// navegação global raiz do app, serve para navegar em telas fora da estrutura do shell, como:
  /// tela de login, splash screen e pags que nao fazem parte da navegação por abas
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  /// navegadores independentes, usados por cada StatefulShellBranch. mantém pilhas de navegação separadas
  static final _rootNavigatorAtendimento = GlobalKey<NavigatorState>(
    debugLabel: 'shellAtendimento',
  );
  static final _rootNavigatorManutencao = GlobalKey<NavigatorState>(
    debugLabel: 'shellManutencao',
  );
  static final _rootNavigatorOrdemOS = GlobalKey<NavigatorState>(
    debugLabel: 'shellOrdemOS',
  );
  static final _rootNavigatorConfiguracoes = GlobalKey<NavigatorState>(
    debugLabel: 'shellConfiguracoes',
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
          /// Branch -> Ordem OS
          StatefulShellBranch(
            navigatorKey: _rootNavigatorOrdemOS,
            routes: [
              GoRoute(
                path: '/ordemOS',
                name: 'ordemOS',
                builder: (context, state) {
                  return OrdemOsPage(key: state.pageKey);
                },
              ),
            ],
          ),

          /// Branch -> Manutenção
          StatefulShellBranch(
            navigatorKey: _rootNavigatorManutencao,
            routes: [
              GoRoute(
                path: '/manutencao',
                name: 'manutencao',
                builder: (context, state) {
                  return ManutencaoPage(key: state.pageKey);
                },
              ),
            ],
          ),

          

          /// Branch -> Atendimento
          StatefulShellBranch(
            navigatorKey: _rootNavigatorAtendimento,
            routes: [
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
                  GoRoute(
                    path: '/gestaoUsuarios',
                    name: 'gestaoUsuarios',
                    builder: (context, state) {
                      return GestaoUsuariosPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: '/cadastroUsuarios',
                        name: 'cadastroUsuarios',
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

          /// Branch -> Gestao Usuarios
          StatefulShellBranch(
            navigatorKey: _rootNavigatorConfiguracoes,
            routes: [
              /// CONFIGURAÇÕES
              GoRoute(
                path: '/configuracoes',
                name: 'configuracoes',
                builder: (context, state) {
                  return ConfiguracoesPage(key: state.pageKey);
                },
                routes: [
                  GoRoute(
                    path: '/meuPerfil',
                    name: 'meuPerfil',
                    builder: (context, state) {
                      return MeuPerfilPage(key: state.pageKey);
                    },
                  ),

                  GoRoute(
                    path: '/tema',
                    name: 'Tema',
                    builder: (context, state) {
                      return TemaPage(key: state.pageKey);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

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
