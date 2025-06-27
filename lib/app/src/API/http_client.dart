
import 'package:http/http.dart' as http;

abstract class IHttpClient{
  get({required String url});
}

class HttpClient implements IHttpClient{
  final client = http.Client();

  @override
  get({required String url}) async{
    return await client.get(Uri.parse(url));
  }
}