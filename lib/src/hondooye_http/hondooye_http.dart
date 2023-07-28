import '../http_utils/hondooye_http_config.dart';
import 'hondooye_http_client.dart';

class HdyHttp {
  HdyHttp({required this.client, required this.config});

  final HdyHttpClient client;
  final HdyHttpConfig config;
}
