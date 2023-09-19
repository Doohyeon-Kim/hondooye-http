import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant/http_constant.dart';
import '../http_utils/hondooye_http_config.dart';

class HdyHttpRequest {
  HdyHttpRequest({required this.httpConfig});

  final HdyHttpConfig httpConfig;

  Map<String, String>? headers;
  Uri? uri;

  Map<String, String> _generateBaseHeaders() {
    final Map<String, String> baseHeaders = {
      'Content-Type': httpConfig.contentType,
    };
    return baseHeaders;
  }

  Map<String, String> _generateAuthorizationHeader(String token) {
    final Map<String, String> authorizationHeader = {'Authorization': "${HdyHttpConst.tokenType.bearer} $token"};
    return authorizationHeader;
  }

  Map<String, String> generateHeaders({String? token, List<Map<String, String>>? headerList}) {
    headers = _generateBaseHeaders();
    if (token != null) {
      headers!.addAll(_generateAuthorizationHeader(token));
    }
    if (headerList != null) {
      for (Map<String, String> header in headerList) {
        headers!.addAll(header);
      }
    }
    return headers!;
  }

  Map<String, String> generateMultipartHeaders({String? token}) {
    headers = {'Content-Type': 'multipart/form-data'};
    if (token != null) {
      headers!.addAll(_generateAuthorizationHeader(token));
    }
    return headers!;
  }

  Uri generateUri(
      {String? scheme,
      String? host,
      int? port,
      required String path,
      Map<String, dynamic>? queryParameters,
      String? query}) {
    uri = Uri(
        scheme: scheme ?? httpConfig.scheme,
        host: host ?? httpConfig.host,
        port: port ?? httpConfig.port,
        path: path,
        queryParameters: queryParameters,
        query: query);
    return uri!;
  }

  Uri externalUri({required String uriAddress, Map<String, dynamic>? queryParameters}) {
    if (queryParameters == null) {
      uri = Uri.parse(uriAddress);
    } else {
      uri = Uri(path: uriAddress, queryParameters: queryParameters);
    }
    return uri!;
  }

  http.Request generateRequest(
      {required String method, required Map<String, String> headers, required Uri uri, Map<String, dynamic>? body}) {
    http.Request request = http.Request(method, uri);
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    return request;
  }
}
