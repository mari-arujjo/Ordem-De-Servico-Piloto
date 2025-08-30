import 'package:flutter/material.dart';
import 'package:ordem_pro/app_widget.dart';
import 'package:ordem_pro/API/http_client.dart';
import 'package:ordem_pro/cores.dart';
import 'package:ordem_pro/entidades/appuser/appuser_repositorio.dart';
import 'package:ordem_pro/entidades/appuser/appuser_store.dart';
import 'package:ordem_pro/entidades/fornecedor/f_repositorio.dart';
import 'package:ordem_pro/entidades/fornecedor/f_store.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoresClass()),
        ChangeNotifierProvider(
          create:
              (_) => FornecedorStore(
                repositorio: FornecedorRepositorio(client: HttpClient()),
              ),
        ),
        ChangeNotifierProvider(
          create:
              (_) => AppUserStore(
                repositorio: AppUserRepositorio(client: HttpClient()),
              ),
        ),
      ],
      child: const AppWidget(),
    ),
  );
}
