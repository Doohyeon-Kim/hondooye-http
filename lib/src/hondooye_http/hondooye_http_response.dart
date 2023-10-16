
import 'package:hondooye_error_handler/hondooye_error_handler.dart';
import 'package:hondooye_logger/hondooye_logger.dart';
import 'package:http/http.dart';

import '../constant/http_constant.dart';
import '../http_utils/hondooye_http_config.dart';
import '../http_utils/hondooye_http_utils.dart';

class HdyHttpResponse {
  HdyHttpResponse({required this.httpConfig});

  final HdyHttpConfig httpConfig;

   dynamic get(Response response) {
    late dynamic responseJson;
    final HdyError? fvError;

    switch (response.statusCode) {
      case 200: // OK
      case 201: // Created
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        Logger.httpResponse(httpResponse: response);
        return responseJson;
      case 204: // No Content
        Logger.httpResponse(httpResponse: response);
        break;
      case 400: // Bad Request
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors.badRequest(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);
      case 401: // Unauthorized
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors.unauthorized(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);

      case 403: // Forbidden
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors.forbidden(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);

      case 404: // Not Found
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors.notFound(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);

      case 408: // Request Timeout
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors.requestTimeout(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);

      case 409: // Conflict
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors.conflict(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);

      case 422: // Unprocessable Entity
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);

      case 500: // Internal Server Error
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors.internalServerError(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);

      case 503: // Service Unavailable
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors.serviceUnavailable(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);

      case 520: // Service Unavailable
        responseJson = httpConfig.jsonDecodingOption == HdyHttpConst.jsonEncodingOption.utf8
            ? HdyHttpUtils.jsonDecodeFromUTF8(response: response)
            : HdyHttpUtils.jsonDecode(response: response);
        fvError = HdyErrors.unknownError(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw HdyException(fvError);

      default:
        fvError = HdyErrors.unknownError();
        throw HdyException(fvError);
    }
  }
}
