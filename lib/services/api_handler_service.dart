import 'dart:io';

import 'package:http/http.dart' as http;

class ApiHandlerService {
  ApiHandlerService._();

  static const Map<String, dynamic> _defaultHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  static const String _baseUrl = String.fromEnvironment('BASE_URL');

  static Future<http.Response> get({
    required String endpoint,
    Map<String, dynamic>? headers,
  }) async {
    Uri uri = Uri.parse(_baseUrl + endpoint);
    return await http.get(
      uri,
      headers: {
        ..._defaultHeaders,
        if (headers != null) ...headers,
      },
    );
  }

  static Future<http.Response> post({
    required String endpoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    Uri uri = Uri.parse(_baseUrl + endpoint);
    return await http.post(
      uri,
      headers: {
        ..._defaultHeaders,
        if (headers != null) ...headers,
      },
      body: body,
    );
  }

  static Future<http.Response> patch({
    required String endpoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    Uri uri = Uri.parse(_baseUrl + endpoint);
    return await http.patch(
      uri,
      headers: {
        ..._defaultHeaders,
        if (headers != null) ...headers,
      },
      body: body,
    );
  }

  static Future<http.Response> delete({
    required String endpoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    Uri uri = Uri.parse(_baseUrl + endpoint);
    return await http.delete(
      uri,
      headers: {
        ..._defaultHeaders,
        if (headers != null) ...headers,
      },
      body: body,
    );
  }
}
