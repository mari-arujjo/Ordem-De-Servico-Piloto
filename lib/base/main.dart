import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:ordem_de_servico/base/app_widget.dart';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/entidades/fornecedor/f_repositorio.dart';
import 'package:ordem_de_servico/src/entidades/fornecedor/f_store.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_repositorio.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => CoresClass()),
        ChangeNotifierProvider(create:(_) => UsuarioStore(repositorio: UsuarioRepositorio(client: HttpClient()))),
        ChangeNotifierProvider(create:(_) => FornecedorStore(repositorio: FornecedorRepositorio(client: HttpClient()))),
      ],
      child: const AppWidget(),
    ),
  );
}
