import 'dart:convert' as convert;
import 'package:hondooye_logger/hondooye_logger.dart';
import 'package:http/http.dart' as http;

import '../constant/http_constant.dart';
import '../hondooye_http/hondooye_http.dart';
import '../hondooye_http/hondooye_http_client.dart';
import 'hondooye_http_config.dart';

class HdyHttpUtils {
  HdyHttpUtils._();

  static dynamic encodeRequestBodyToJson(dynamic data, String contentType) {
    return contentType == HdyHttpConst.contentType.json
        ? convert.utf8.encode(convert.jsonEncode(data))
        : data;
  }

  static jsonDecode({required http.Response response}) {
    return convert.jsonDecode(response.body);
  }

  static jsonDecodeFromUTF8({required http.Response response}) {
    return convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
  }

  static void requestLogger({required http.Request request}) {
    Logger.httpRequest(httpRequest: request);
  }

  static void responseLogger({required http.Response response}) {
    Logger.httpResponse(httpResponse: response);
  }

  static HdyHttp generateHttp(
      {String? scheme,
      required String host,
      int? port,
      String? contentType,
      String? tokenType,
      JsonDecodingOption? jsonDecodingOption}) {
    final httpConfig = HdyHttpConfig(
      scheme: scheme ?? "https",
      host: host,
      port: port ?? 3000,
      contentType: contentType ?? "application/json",
      tokenType: tokenType ?? "Bearer ",
      jsonDecodingOption: jsonDecodingOption ?? JsonDecodingOption.noOption,
    );
    return HdyHttp(
        config: httpConfig, client: HdyHttpClient(httpConfig: httpConfig));
  }
}
