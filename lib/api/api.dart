import 'dart:convert';

import 'package:http/http.dart' as http;

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete;
}
typedef JSON = Map<String, dynamic>;
typedef JSONGen<T> = Map<String, T>;

class Api {
  static const _domain = "http://220.110.147.50:8726";

  static Future<http.Response> _request(
      String url, {
        HttpMethod method = HttpMethod.get,
        JSON? body,
      }) async {
    try {
      switch (method) {
        case HttpMethod.get:
          return await http.get(Uri.parse(url));
        case HttpMethod.post:
          return await http.post(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(body),
          );
        case HttpMethod.put:
          return await http.put(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(body),
          );
        case HttpMethod.patch:
          return await http.patch(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(body),
          );
        case HttpMethod.delete:
          return await http.delete(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(body),
          );
      }
    } catch (e) {
      return http.Response('', 404);
    }
  }


}