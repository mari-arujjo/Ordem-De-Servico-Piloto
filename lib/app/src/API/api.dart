// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class Api {
  final dio = (Dio(BaseOptions(
    baseUrl: 'http://192.168.56.1:5214/')
    ));

  Future<Response> get (String endPoint) async{
    try{
      return await dio.get(endPoint);
    }
    on DioException catch (e){
      // ignore: avoid_print
      print('Erro do DIO: ${e.message}');
      rethrow;
    }
    catch (error){
      rethrow;
    }
  }

}