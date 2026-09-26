import 'package:ap_common_flutter_core/src/l10n/ap_localizations.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('transform timeout uses the localized timeout message', () async {
    for (final AppLocale locale in AppLocale.values) {
      await setApLocale(locale);
      final DioException exception = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.transformTimeout,
      );
      expect(exception.i18nMessage, ap.timeoutMessage);
    }
  });

  group('DioExceptionI18nExtension isJsonResponse', () {
    test('should return true for badResponse with Map data', () {
      final DioException exception = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.badResponse,
        response: Response<dynamic>(
          requestOptions: RequestOptions(),
          data: <String, dynamic>{'description': 'error'},
        ),
      );
      expect(exception.isJsonResponse, isTrue);
    });

    test('should return false for badResponse with non-Map data', () {
      final DioException exception = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.badResponse,
        response: Response<dynamic>(
          requestOptions: RequestOptions(),
          data: 'string data',
        ),
      );
      expect(exception.isJsonResponse, isFalse);
    });

    test('should return false for non-badResponse type', () {
      final DioException exception = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      );
      expect(exception.isJsonResponse, isFalse);
    });
  });

  group('DioExceptionI18nExtension falconMessage', () {
    test('should return description from JSON response', () {
      final DioException exception = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.badResponse,
        response: Response<dynamic>(
          requestOptions: RequestOptions(),
          data: <String, dynamic>{'description': 'forbidden'},
        ),
      );
      expect(exception.falconMessage, 'forbidden');
    });

    test('should fallback to message when no description', () {
      final DioException exception = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.badResponse,
        message: 'fallback',
        response: Response<dynamic>(
          requestOptions: RequestOptions(),
          data: <String, dynamic>{'other': 'data'},
        ),
      );
      expect(exception.falconMessage, 'fallback');
    });

    test('should return null for non-JSON response', () {
      final DioException exception = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      );
      expect(exception.falconMessage, isNull);
    });
  });
}
