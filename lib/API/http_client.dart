
import 'package:http/http.dart' as http;

abstract class IHttpClient{
  get({required String url});

  post({required String url, Map<String, String>? headers, Object? body});

  update({required String url, Map<String, String>? headers, Object? body});

  delete({required String url});

}

class HttpClient implements IHttpClient{
  final client = http.Client();

  @override
  get({required String url}) async{
    return await client.get(Uri.parse(url));
  }

  @override
  post({required String url, Map<String, String>? headers, Object? body}) async {
    return await client.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
  }

  @override
  update({required String url, Map<String, String>? headers, Object? body}) async {
    return await client.put(
      Uri.parse(url), 
      headers: headers,
      body: body,
    );
  }

  @override
  delete({required String url}) async{
    return await client.delete(Uri.parse(url));
  }
}