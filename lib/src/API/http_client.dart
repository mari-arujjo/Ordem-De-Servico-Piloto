
import 'package:http/http.dart' as http;

abstract class IHttpClient{
  get({required String url});

  post({required String url});

  update({required String url});

  delete({required String url});

}

class HttpClient implements IHttpClient{
  final client = http.Client();

  @override
  get({required String url}) async{
    return await client.get(Uri.parse(url));
  }

  @override
  post({required String url}) async {
    return await client.post(Uri.parse(url));
  }

  @override
  update({required String url}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  delete({required String url}) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}