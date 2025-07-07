part of 'network_client.dart';

class NetworkResponse {
  final int? statusCode;
  final Map<String, dynamic>? responseData;
  final String? errorMessage;

  NetworkResponse({this.statusCode, this.responseData, this.errorMessage});
}
