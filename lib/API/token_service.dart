import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenService {
  final storage = FlutterSecureStorage();
  final String _key = "jwt_token";

  Future<void> salvarToken(String token) async{
    await storage.write(key: _key, value: token);
  }

  Future<String?> obterToken() async {
    return await storage.read(key: _key);
  }

  Future<void> deletarToken() async {
    await storage.delete(key: _key);
  }

  

  bool taExpirado (String token){
    return JwtDecoder.isExpired(token);
  }

  DateTime obterDataDeValidadeDoToken (String token){
    return JwtDecoder.getExpirationDate(token);
  }

  Duration obterIdadeDoToken(String token){
    return JwtDecoder.getTokenTime(token);
  }

}