import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  // final JsonDecoder _decoder = new JsonDecoder();
  request(category) async {
    var url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=863566d7e61f45178d80ca9ea58f3486';
    http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
    });
}
}
