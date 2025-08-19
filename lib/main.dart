import 'package:flutter/material.dart';
import 'package:ordem_de_servico/API/token_service.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:ordem_de_servico/app_widget.dart';
import 'package:ordem_de_servico/API/http_client.dart';
import 'package:ordem_de_servico/entidades/appuser/appuser_repositorio.dart';
import 'package:ordem_de_servico/entidades/appuser/appuser_store.dart';
import 'package:ordem_de_servico/entidades/fornecedor/f_repositorio.dart';
import 'package:ordem_de_servico/entidades/fornecedor/f_store.dart';
import 'package:provider/provider.dart';

void main() async {
  final _appUserRepositorio = AppUserRepositorio(client: HttpClient());
  final _tokenService = TokenService();
  String username = 'username';
  String senha = 'senha';
  try{
    String token = await _appUserRepositorio.login(username, senha);
    await _tokenService.salvarToken(token);
    if(_tokenService.taExpirado(token)){
      print('Token ta expirado boyzao');
    } else{
      print('Token ta valido!!');
    }
  } catch (e){
    rethrow;
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(_) => CoresClass()
        ),
        ChangeNotifierProvider(create:(_) => FornecedorStore(repositorio: FornecedorRepositorio(client: HttpClient()))
        ),
        ChangeNotifierProvider(create:(_) => AppUserStore(repositorio: AppUserRepositorio(client: HttpClient()))),
      ],
      child: const AppWidget(),
    ),
  );
}
