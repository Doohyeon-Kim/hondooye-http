import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hondooye_error_handler/hondooye_error_handler.dart';
import 'package:hondooye_logger/hondooye_logger.dart';

import '../constant/http_constant.dart';
import '../http_utils/hondooye_http_config.dart';
import '../http_utils/hondooye_http_utils.dart';
import 'hondooye_http_request.dart';
import 'hondooye_http_response.dart';

class HdyHttpClient {
  HdyHttpClient({required this.httpConfig}) {
    request = HdyHttpRequest(httpConfig: httpConfig);
    response = HdyHttpResponse(httpConfig: httpConfig);
  }

  final HdyHttpConfig httpConfig;

  late HdyHttpRequest request;

  late HdyHttpResponse response;

  Future<dynamic> get(
      {required String path,
      int? port,
      Map<String, dynamic>? queryParameters,
      String? query,
      String? token,
      List<Map<String, String>>? headerList}) async {
    final Uri uri = request.generateUri(path: path, port: port, queryParameters: queryParameters, query: query);
    final Map<String, String> headers = request.generateHeaders(token: token, headerList: headerList);
    http.Request httpRequest = request.generateRequest(method: HdyHttpConst.method.get, headers: headers, uri: uri);
    Logger.httpRequest(httpRequest: httpRequest);

    try {
      final streamedResponse = await httpRequest.send().timeout(httpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return response.get(result);
    } on TimeoutException {
      HdyException.requestTimeout();
    } on HdyException {
      /// Handle HdyException
    } catch (error) {
      Logger.errorMessage(error);
    }
  }

  Future<dynamic> post(
      {required String path,
      int? port,
      required Map<String, dynamic> body,
      String? token,
      List<Map<String, String>>? headerList}) async {
    final Uri uri = request.generateUri(path: path, port: port);

    final Map<String, String> headers = request.generateHeaders(token: token, headerList: headerList);
    http.Request httpRequest =
        request.generateRequest(method: HdyHttpConst.method.post, headers: headers, uri: uri, body: body);
    Logger.httpRequest(httpRequest: httpRequest);

    try {
      final streamedResponse = await httpRequest.send().timeout(httpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return response.get(result);
    } on TimeoutException {
      HdyException.requestTimeout();
    } on HdyException {
      /// Handle HdyException
    } catch (error) {
      Logger.errorMessage(error);
    }
  }

  Future<dynamic> put(
      {required String path,
      int? port,
      required Map<String, dynamic> body,
      String? token,
      List<Map<String, String>>? headerList}) async {
    final Uri uri = request.generateUri(path: path, port: port);
    final Map<String, String> headers = request.generateHeaders(token: token, headerList: headerList);
    http.Request httpRequest =
        request.generateRequest(method: HdyHttpConst.method.put, headers: headers, uri: uri, body: body);
    Logger.httpRequest(httpRequest: httpRequest);

    try {
      final streamedResponse = await httpRequest.send().timeout(httpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return response.get(result);
    } on TimeoutException {
      HdyException.requestTimeout();
    } on HdyException {
      /// Handle HdyException
    } catch (error) {
      Logger.errorMessage(error);
    }
  }

  Future<dynamic> delete(
      {required String path,
      int? port,
      required Map<String, dynamic> body,
      String? token,
      List<Map<String, String>>? headerList}) async {
    final Uri uri = request.generateUri(path: path, port: port);
    final Map<String, String> headers = request.generateHeaders(token: token, headerList: headerList);
    http.Request httpRequest =
        request.generateRequest(method: HdyHttpConst.method.delete, headers: headers, uri: uri, body: body);
    Logger.httpRequest(httpRequest: httpRequest);

    try {
      final streamedResponse = await httpRequest.send().timeout(httpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return response.get(result);
    } on TimeoutException {
      HdyException.requestTimeout();
    } on HdyException {
      /// Handle HdyException
    } catch (error) {
      Logger.errorMessage(error);
    }
  }

  Future<dynamic> patch(
      {required String path,
      int? port,
      required Map<String, dynamic> body,
      String? token,
      List<Map<String, String>>? headerList}) async {
    final Uri uri = request.generateUri(path: path, port: port);
    final Map<String, String> headers = request.generateHeaders(token: token, headerList: headerList);
    http.Request httpRequest =
        request.generateRequest(method: HdyHttpConst.method.patch, headers: headers, uri: uri, body: body);
    Logger.httpRequest(httpRequest: httpRequest);

    try {
      final streamedResponse = await httpRequest.send().timeout(httpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return response.get(result);
    } on TimeoutException {
      HdyException.requestTimeout();
    } on HdyException {
      /// Handle HdyException
    } catch (error) {
      Logger.errorMessage(error);
    }
  }

  Future<dynamic> multipart(
      {required String uriAddress,
      required String method,
      Map<String, dynamic>? queryParameters,
      String? query,
      required File file,
      String? token,
      List<Map<String, String>>? headerList}) async {
    Uri url = Uri.parse(uriAddress);
    final multipartHeaders = request.generateMultipartHeaders(token: token, headerList: headerList);
    http.MultipartRequest multipartRequest = http.MultipartRequest(method, url);
    multipartRequest.headers.addAll(multipartHeaders);
    multipartRequest.files.add(await http.MultipartFile.fromPath('file', file.path));

    Logger.multipartRequest(multipartRequest: multipartRequest);

    try {
      http.StreamedResponse streamedResponse = await multipartRequest.send().timeout(httpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return response.get(result);
    } on TimeoutException {
      HdyException.requestTimeout();
    } on HdyException {
      /// Handle HdyException
    } catch (error) {
      Logger.errorMessage(error);
    }
  }

  Future<dynamic> custom(
      {required String uriAddress,
      required String method,
      Map<String, dynamic>? queryParameters,
      String? query,
      Map<String, dynamic>? body,
      String? token,
      List<Map<String, String>>? headerList}) async {
    final Uri uri = request.custom(uriAddress: uriAddress, queryParameters: queryParameters);
    final Map<String, String> headers = request.generateHeaders(token: token, headerList: headerList);
    http.Request httpRequest = request.generateRequest(method: method, headers: headers, body: body, uri: uri);
    Logger.httpRequest(httpRequest: httpRequest);

    try {
      final streamedResponse = await httpRequest.send().timeout(httpConfig.networkTimeLimit);
      final response = await http.Response.fromStream(streamedResponse);
      return httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
          ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
          : HdyHttpUtils.jsonDecode(response: response);
    } on TimeoutException {
      HdyException.requestTimeout();
    } on HdyException {
      /// Handle HdyException
    } catch (error) {
      Logger.errorMessage(error);
    }
  }
}
