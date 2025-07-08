import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
part 'network_response.dart';

class NetworkClient {
  final Logger _logger = Logger();
  final String defaultErrorMessage = "Something wrong";

  final VoidCallback onUnAuthorized;
  final Map<String, String> commonHeaders;
  NetworkClient({required this.commonHeaders, required this.onUnAuthorized});

  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHeaders); // Log request
      final Response response = await get(uri, headers: commonHeaders);
      _logResponse(response: response); // Log response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: "Un-Authorized",
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseBody['msg'] ?? defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHeaders, body: body); // Log request
      final Response response = await post(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response: response); // Log response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: "Un-Authorized",
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseBody['msg'] ?? defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> putRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHeaders); // Log request
      final Response response = await put(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response: response); // Log response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: "Un-Authorized",
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseBody['msg'] ?? defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHeaders); // Log request
      final Response response = await patch(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response: response); // Log response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: "Un-Authorized",
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseBody['msg'] ?? defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> deleteRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHeaders); // Log request
      final Response response = await delete(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response: response); // Log response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: "Un-Authorized",
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseBody['msg'] ?? defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) {
    final String message =
        '''
      URL => $url
      HEADER => $header
      BODY => $body
        ''';
    _logger.i(message);
  }

  void _logResponse({required Response response}) {
    final String message =
        '''
      URL => ${response.request?.url}
      STATUS CODE => ${response.statusCode}
      HEADER => ${response.request?.headers}
      BODY => ${response.body}
        ''';
    _logger.i(message);
  }
}
