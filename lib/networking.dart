import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  final url;
  Networking({this.url});
  Future getData() async {
    http.Response response = await http.get(url);
    String data = response.body;
    var weather = jsonDecode(data);
    return weather;
  }

}