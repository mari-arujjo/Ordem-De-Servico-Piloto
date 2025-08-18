import 'dart:convert';
import 'package:ordem_de_servico/API/http_client.dart';
import 'package:ordem_de_servico/entidades/appuser/appuser_model.dart';

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

  Future<AppUserModel> login(String username, String senha) async {
    final response = await client.post(
      url:'https://api-ordem-de-servico-tfyb.onrender.com/OrdemDeServico/account/login',
      body: {
        "username": username,
        "senha": senha
      }
    );
    try{
      final body = jsonDecode(response.body);
      return AppUserModel.fromMap(body);
    } catch(e){
      throw Exception(e);
    }

  }
}