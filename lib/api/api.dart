import 'dart:convert';

import 'package:homeless/model/coOp.dart';
import 'package:homeless/model/work-post.dart';
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
  static const _domain = "http://222.110.147.50:8726";

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

  static Future<List<WorkPostModel>> fetchWorkPost() async {
    final response = await _request("$_domain/work-post");
    final list = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    try {
      if (response.statusCode == 200) {
        return list.map((e) => WorkPostModel.fromJson(e as JSON)).toList();
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<CoOpModel>> fetchCoOp() async {
    final response = await _request("$_domain/coop");
    final list = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    try {
      if (response.statusCode == 200) {
        return list.map((e) => CoOpModel.fromJson(e as JSON)).toList();
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      rethrow;
    }
  }
}