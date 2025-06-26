import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/src/controllers/gestao_usuarios_controller.dart';
import 'package:ordem_de_servico/app/base/app_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>GestaoUsuariosController()),
      ],
      child: const AppWidget()
    )
  );
}