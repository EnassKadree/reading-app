import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../features/shared/data/data_source.dart';

class Api {
  Future<dynamic> fullPost(
      {required String url, Map<String, dynamic>? body, String? token}) async {
    String locale = DataSource().getLocale() ?? 'ar';
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept-Language': locale,
      if (token != null) 'Authorization': 'Bearer $token',
    };
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return responseData;
    } else {
      throw Exception(responseData['message']);
    }
  }

  Future<dynamic> postWithoutToken({required String url}) {
    return fullPost(url: url);
  }

  Future<dynamic> postWithoutTokenWithBody(
      {required String url, required body}) {
    return fullPost(url: url, body: body);
  }

  Future<dynamic> post(
      {required String url, required body, required String? token}) {
    return fullPost(url: url, body: body, token: token);
  }

  Future<dynamic> get({required String url, String? token}) async {
    String locale = DataSource().getLocale() ?? 'ar';

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept-Language': locale,
      if (token != null) 'Authorization': 'Bearer $token',
    };

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200 || response.statusCode == 202) {
      return jsonDecode(response.body);
    } else {
      throw Exception('message: ${response.body}');
    }
  }

  Future<dynamic> getWithToken(
      {required String url, required String token}) async {
    return get(url: url, token: token);

  }
}
