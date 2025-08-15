import 'dart:convert';

import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/entidades/appuser/appuser_model.dart';

class AppUserRepositorio {
  final IHttpClient client;
  AppUserRepositorio({required this.client});

  Future<List<AppUserModel>> obterUsuarios() async {
    final response = await client.get(
      url:'https://api-ordem-de-servico-tfyb.onrender.com/OrdemDeServico/account/obterTodos',
    );
    try{
      final body = jsonDecode(response.body) as List;
      return body.map((item)=> AppUserModel.fromMap(item)).toList();
    } catch (e){
      throw Exception(e);
    }
  }
}