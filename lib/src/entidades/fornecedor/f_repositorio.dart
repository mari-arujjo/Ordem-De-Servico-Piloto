import 'dart:convert';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/entidades/fornecedor/f_model.dart';

class FornecedorRepositorio{
  final IHttpClient client;
  FornecedorRepositorio({required this.client});

  Future<List<FornecedorModel>> obterFornecedores() async {
    final response = await client.get(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/fornecedor'
    );
    try{
      final body = jsonDecode(response.body) as List;
      return body.map((item)=> FornecedorModel.fromMap(item)).toList();
    }catch(e){
      throw Exception(e);
    }
  }
}