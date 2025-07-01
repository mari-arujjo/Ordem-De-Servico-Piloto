import 'package:flutter/material.dart';
import 'package:ordem_de_servico/base/app_widget.dart';
import 'package:ordem_de_servico/src/usuario/u_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UsuarioController())
      ],
      child: const AppWidget(),
    ),
  );
}