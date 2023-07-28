import '../constant/http_constant.dart';

class HdyHttpConfig {
  HdyHttpConfig({
    this.scheme = "https",
    this.host = "localhost",
    this.port = 3000,
    this.contentType = "application/json",
    this.tokenType = "Bearer ",
    this.networkTimeLimit = const Duration(milliseconds: 20000),
    this.jsonDecodingOption = JsonDecodingOption.noOption,
  });

  final String scheme;
  final String host;
  final int port;
  final String contentType;
  final String tokenType;
  final Duration networkTimeLimit;
  final JsonDecodingOption jsonDecodingOption;
}
