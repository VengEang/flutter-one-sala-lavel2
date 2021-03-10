import 'package:http/http.dart' as http;

Future<String> get getData async {
  String url="https://pub.dev/packages/http/versions";
  http.Response response= await http.get(url);
  if(response.statusCode==200)
    return response.body;
  else
    throw Exception("Error code: ${response.statusCode}");
}