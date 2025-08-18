import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ordem_de_servico/API/http_client.dart';
import 'package:ordem_de_servico/entidades/fornecedor/f_model.dart';
import 'package:ordem_de_servico/popup.dart';

class FornecedorRepositorio {
  final IHttpClient client;
  FornecedorRepositorio({required this.client});

  Future<List<FornecedorModel>> obterFornecedores() async {
    final response = await client.get(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/OrdemDeServico/fornecedor',
    );
    try {
      final body = jsonDecode(response.body) as List;
      return body.map((item) => FornecedorModel.fromMap(item)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<FornecedorModel> cadastrarFornecedor(
    BuildContext context,
    FornecedorModel forn,
  ) async {
    final response = await client.post(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/OrdemDeServico/fornecedor',
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(forn.toMap()),
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
      return FornecedorModel.fromMap(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<FornecedorModel> alterarDadosDoFornecedor(
    BuildContext context,
    FornecedorModel forn,
    int id,
  ) async {
    final response = await client.update(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/OrdemDeServico/fornecedor/$id',
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(forn.toMap()),
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
      return FornecedorModel.fromMap(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deletarFornecedor(int id) async {
    await client.delete(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/OrdemDeServico/fornecedor/$id',
    );
    try {
      return;
    } catch (e) {
      throw Exception(e);
    }
  }
}
