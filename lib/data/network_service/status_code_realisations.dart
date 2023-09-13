import 'package:dio/dio.dart';

final class StatusCodeRealisations {
  void onSpecialStatusCode(int? code, {String? errorText, required RequestOptions requestOptions}) async {
    switch (code) {
      case (null):
        {}
        break;
      case (401):
        {}
        break;
      case (461):
        {}
        break;
      case (463):
        {}
        break;
      case (403):
        {}
        break;
      case (465):
        {}
        break;
      case (503):
        {}
        break;
    }
  }
}
