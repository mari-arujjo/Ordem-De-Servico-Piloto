// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

class UsuarioModel {
  final int id_usuario;
  final String usuario;
  final String nome;
  final int nivel_acesso;
  final String senha;
  final Uint8List? foto;

  UsuarioModel({
    required this.id_usuario,
    required this.usuario,
    required this.nome,
    required this.nivel_acesso,
    required this.senha,
    this.foto,
  });

  // vai retonrar um mapa que a key=string e value=dynamic(int, string, float etc)
  // PARA RECEBER
  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id_usuario: map['id_usuario'] ?? 0,
      usuario: map['usuario'] ?? '',
      nome: map['nome'] ?? '',
      nivel_acesso: map['nivel_acesso'] ?? 3, // padrão mais seguro
      senha: map['senha'] is String ? map['senha'] : '',
      foto: (map['foto'] != null && map['foto'] is String && (map['foto'] as String).isNotEmpty)
              ? base64Decode(map['foto'])
              : null,
    );
  }

  // PARA ENVIAR
  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id_usuario,
      'usuario': usuario,
      'nome': nome,
      'nivel_acesso': nivel_acesso,
      'senha': senha,
      'foto': foto != null ? base64Encode(foto!) : null,

    };
  }
}
