class HdyHttpConst {
  HdyHttpConst._();

  // ignore: library_private_types_in_public_api
  static _ContentType contentType = _ContentType();

  // ignore: library_private_types_in_public_api
  static _TokenType tokenType = _TokenType();

  // ignore: library_private_types_in_public_api
  static _Method method = _Method();

  // ignore: library_private_types_in_public_api
  static _JsonDecodingOption jsonEncodingOption = _JsonDecodingOption();
}

class _ContentType {
  String json = "application/json";
}

class _TokenType {
  String bearer = "Bearer ";
}

enum HttpMethod { GET, POST, PUT, DELETE, PATCH, MULTIPART }

class _Method {
  String get = HttpMethod.GET.name;
  String post = HttpMethod.POST.name;
  String put = HttpMethod.PUT.name;
  String delete = HttpMethod.DELETE.name;
  String patch = HttpMethod.PATCH.name;
  String multipart = HttpMethod.MULTIPART.name;
}

enum JsonDecodingOption {
  noOption,
  utf8,
}

class _JsonDecodingOption {
  JsonDecodingOption noOption = JsonDecodingOption.noOption;
  JsonDecodingOption utf8 = JsonDecodingOption.utf8;
}
