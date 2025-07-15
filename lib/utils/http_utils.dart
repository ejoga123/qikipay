import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtils {
  static Future<Map<String, dynamic>> getJson(String url,
      {Map<String, String>? headers}) async {
    final response = await http.get(Uri.parse(url), headers: headers);
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> postJson(
      String url, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return jsonDecode(response.body);
  }

  static bool isSuccess(http.Response response) =>
      response.statusCode >= 200 && response.statusCode < 300;
}
