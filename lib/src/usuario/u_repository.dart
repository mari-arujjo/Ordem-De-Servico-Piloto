import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/helper/popup.dart';
import 'package:ordem_de_servico/src/usuario/u_model.dart';

abstract class IUsuarioRepository {
  Future<List<UsuarioModel>> obterUsuarios();
}

class UsuarioRepository implements IUsuarioRepository {
  final IHttpClient client;
  UsuarioRepository({required this.client});

  @override
  Future<List<UsuarioModel>> obterUsuarios() async {
    final response = await client.get(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario',
    );
    try {
      final body = jsonDecode(response.body) as List;
      return body.map((item) => UsuarioModel.fromMap(item)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UsuarioModel> cadastrarUsuario(BuildContext context, UsuarioModel user) async {
    final response = await client.post(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );
    try {
      final body = jsonDecode(response.body);
      if (body['errors'] != null){
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;  
        final msg = 'Campo: $key \n($value)';  
        PopUp().PopUpAlert(context, msg);
      }
      return UsuarioModel.fromMap(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deletarUsuario(int id) async {
    await client.delete(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario/$id',
    );
    try{
      return;
    }catch (e) {
      throw Exception(e);
    }
  }

  Future<UsuarioModel> alterarUsuario(BuildContext context, UsuarioModel user, int id) async {
    final response = await client.update(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario/$id',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );
    try {
      final body = jsonDecode(response.body);
      if (body['errors'] != null){
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;  
        final msg = 'Campo: $key \n($value)'; 
        PopUp().PopUpAlert(context, msg);
      }
      return UsuarioModel.fromMap(body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
