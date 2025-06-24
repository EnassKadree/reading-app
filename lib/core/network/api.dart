import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Api 
{
  Future<dynamic> postWithoutToken({required String url}) async 
  {
    Map<String, String> headers = 
    {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    http.Response response =
        await http.post(Uri.parse(url), headers: headers);
    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 202)
    {
      return data;
    } else 
    {
      throw Exception(data['message']);
    }
  }
  Future<dynamic> postWithoutTokenWithBody({required String url, required body}) async 
  {
    Map<String, String> headers = 
    {
      'Accept': 'application/json',
    };
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 202)
    {
      return data;
    } else 
    {
      throw Exception(data['message']);
    }
  }

  Future<dynamic> getWithoutToken({required String url}) async 
  {
    Map<String, String> headers = 
    {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    dynamic data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 202)
    {
      return data;
    } else 
    {
      throw Exception(data['message']);
    }
  }

  Future<dynamic> get({required String url, @required String? token}) async 
  {
    Map<String, String> headers = {};

    if (token != null) 
    {
      headers.addAll(
      {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    dynamic data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 202) {
      return data;
    } else
    {
      throw Exception(data['message']);
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async
  {
    Map<String, String> headers = {};
    Map<String,dynamic> data = {};

    if (token != null) {
      headers.addAll(
        {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
      data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 202) {
      return data;
    } 
    else {
      throw Exception(
          data['message']);
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async
  {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 202) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
