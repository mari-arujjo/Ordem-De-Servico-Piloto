import 'package:flutter/cupertino.dart';
import 'package:ordem_de_servico/src/API/alerts.dart';
import 'package:ordem_de_servico/src/usuario/u_model.dart';
import 'package:ordem_de_servico/src/usuario/u_repository.dart';

class UsuarioStore {
  final IUsuarioRepository repositorio;
  UsuarioStore({required this.repositorio});

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<UsuarioModel>> state = ValueNotifier<List<UsuarioModel>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  Future getUsuarios() async{
    isLoading.value = true;

    try{
      final result = await repositorio.obterUsuarios();
      state.value=result;
    } on NotFound catch (e){
      erro.value=e.message;
    } catch (e){
      erro.value = e.toString();
    }

    isLoading.value = false;
  }

}