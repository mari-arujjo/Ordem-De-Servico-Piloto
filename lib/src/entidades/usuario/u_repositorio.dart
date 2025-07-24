import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/helper/popup.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_model.dart';

class UsuarioRepositorio {
  final IHttpClient client;
  UsuarioRepositorio({required this.client});

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

  Future<UsuarioModel> cadastrarUsuario(
    BuildContext context,
    UsuarioModel user,
  ) async {
    final response = await client.post(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      final body = jsonDecode(response.body);
      if (body['errors'] != null) {
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;
        final msg = 'Campo: $key \n($value)';
        throw Exception(msg);
      }
    }
    try {
      final body = jsonDecode(response.body);
      return UsuarioModel.fromMap(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UsuarioModel> alterarDadosDoUsuario(
    BuildContext context,
    UsuarioModel user,
    int id,
  ) async {
    final response = await client.update(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario/$id',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      final body = jsonDecode(response.body);
      if (body['errors'] != null) {
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;
        final msg = 'Campo: $key \n($value)';
        PopUp().PopUpAlert(context, msg);
        throw Exception(msg);
      }
    }
    try {
      final body = jsonDecode(response.body);
      return UsuarioModel.fromMap(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UsuarioModel> alterarSenhaDoUsuario(
    BuildContext context,
    UsuarioModel user,
    int id,
  ) async {
    final response = await client.update(
      url:
          'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario/$id/senha',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );

    final body = jsonDecode(response.body);
    if (body['errors'] != null) {
      final erro = body['errors'] as Map<String, dynamic>;
      final key = erro.keys.first;
      final value = (erro[key] as List).first;
      final msg = 'Campo: $key \n($value)';
      PopUp().PopUpAlert(context, msg);
    }
    try {
      final body = jsonDecode(response.body);
      return UsuarioModel.fromMap(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UsuarioModel> alterarFotoDoUsuario(
    BuildContext context,
    UsuarioModel user,
    int id,
  ) async {
    final response = await client.update(
      url:
          'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario/$id/foto',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      final body = jsonDecode(response.body);
      if (body['errors'] != null) {
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;
        final msg = 'Campo: $key \n($value)';
        PopUp().PopUpAlert(context, msg);
      }
    }
    try {
      final body = jsonDecode(response.body);
      return UsuarioModel.fromMap(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deletarUsuario(int id) async {
    await client.delete(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario/$id',
    );
    try {
      return;
    } catch (e) {
      throw Exception(e);
    }
  }
}
