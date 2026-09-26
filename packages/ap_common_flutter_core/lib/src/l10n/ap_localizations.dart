import 'package:ap_common_flutter_core/src/l10n/strings.g.dart';
import 'package:ap_common_flutter_core/src/ui/ap_icon.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

export 'package:ap_common_flutter_core/src/l10n/strings.g.dart';
export 'package:intl/intl.dart';

/// Helper to set locale for both slang and Intl (DateFormat).
/// Call this from your app when changing locale.
Future<AppLocale> setApLocale(AppLocale locale) async {
  final AppLocale result = await LocaleSettings.setLocale(locale);
  Intl.defaultLocale = result.flutterLocale.toString();
  return result;
}

/// Helper to set locale from a Flutter [Locale].
Future<AppLocale> setApLocaleFromFlutter(Locale locale) async {
  final AppLocale appLocale = AppLocaleUtils.parseLocaleParts(
    languageCode: locale.languageCode,
    scriptCode: locale.scriptCode,
    countryCode: locale.countryCode,
  );
  return setApLocale(appLocale);
}

/// Helper to use device locale for both slang and Intl (DateFormat).
Future<AppLocale> useApDeviceLocale() async {
  final AppLocale result = await LocaleSettings.useDeviceLocale();
  Intl.defaultLocale = result.flutterLocale.toString();
  return result;
}

extension ApExtension on ApLocalizations {
  String get dateTimeLocale {
    final AppLocale current = LocaleSettings.currentLocale;
    switch (current) {
      case AppLocale.zhHantTw:
        return 'zh-TW';
      case AppLocale.ja:
        return 'ja';
      case AppLocale.en:
        return 'en-US';
    }
  }

  String get locale {
    final AppLocale current = LocaleSettings.currentLocale;
    switch (current) {
      case AppLocale.zhHantTw:
        return 'zh-TW';
      case AppLocale.ja:
        return 'ja';
      case AppLocale.en:
        return 'en-US';
    }
  }

  String get iconText {
    switch (ApIcon.code) {
      case ApIcon.filled:
        return filled;
      case ApIcon.outlined:
      default:
        return outlined;
    }
  }

  List<String> get weekdaysCourse => <String>[
        mon,
        tue,
        wed,
        thu,
        fri,
        sat,
        sun,
      ];

  List<String> get weekdays => <String>[
        sunday,
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
      ];
}

extension DioExceptionI18nExtension on DioException {
  String? get i18nMessage {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.transformTimeout:
        return ap.timeoutMessage;
      case DioExceptionType.badCertificate:
        return ap.unknownError;
      case DioExceptionType.badResponse:
        if (response!.data is Map<String, dynamic>) {
          //ignore: avoid_dynamic_calls
          return (response!.data['description'] ?? message) as String;
        } else {
          return message;
        }
      case DioExceptionType.connectionError:
        return ap.noInternet;
      case DioExceptionType.unknown:
        return ap.unknownError;
      case DioExceptionType.cancel:
        return null;
    }
  }

  bool get isJsonResponse {
    return type == DioExceptionType.badResponse &&
        response!.data is Map<String, dynamic>;
  }

  String? get falconMessage {
    // Define in falcon description
    if (isJsonResponse) {
      //ignore: avoid_dynamic_calls
      return (response!.data['description'] ?? message) as String;
    } else {
      return null;
    }
  }
}
