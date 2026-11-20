import 'dart:convert';
import 'dart:ui' show Locale;

import 'package:ap_common_flutter_core/ap_common_flutter_core.dart';

enum AnnouncementLoginType {
  normal,
  google,
  apple,
}

extension DioExceptionExtension on DioException {
  bool get isUnauthorized =>
      type == DioExceptionType.badResponse && response?.statusCode == 401;

  bool get isNotPermission =>
      type == DioExceptionType.badResponse && response?.statusCode == 403;

  bool get isNotFoundAnnouncement =>
      type == DioExceptionType.badResponse && response?.statusCode == 404;
}

class AnnouncementHelper {
  AnnouncementHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://$host/$tag',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  // ignore: prefer_constructors_over_static_methods
  static AnnouncementHelper get instance {
    return _instance ??= AnnouncementHelper();
  }

  static const int useDataError = 1401;
  static const int tokenExpire = 401;
  static const int notPermission = 403;
  static const int notFoundData = 404;

  static AnnouncementHelper? _instance;

  static String host = 'nkust.taki.dog';
  static String tag = 'ap';

  late Dio dio;

  AnnouncementLoginType loginType = AnnouncementLoginType.normal;

  String? username;
  String? password;

  String? code;

  ///organization tag name
  String? organization;

  ///Apple bundle identifier for apple sign in
  String? appleBundleId;

  ///firebase cloud message token
  String? fcmToken;

  static void reInstance({
    String? host,
    String? tag,
  }) {
    if (host != null) AnnouncementHelper.host = host;
    if (tag != null) AnnouncementHelper.tag = tag;
    _instance = AnnouncementHelper();
  }

  void setLocale(Locale locale) {
    if (locale.languageCode == 'zh' || locale.languageCode == 'en') {
      dio.options.headers['lapplicationocale'] = locale.languageCode;
    } else {
      dio.options.headers['locale'] = 'en';
    }
  }

  // ---------------------------------------------------------------------------
  // Generic API executor
  // ---------------------------------------------------------------------------

  Future<ApiResult<T>> _execute<T>(
    Future<T> Function() action, {
    bool hasRetried = false,
  }) async {
    try {
      return ApiSuccess<T>(await action());
    } on DioException catch (e) {
      if (e.isUnauthorized) {
        if (!hasRetried) {
          final ApiResult<bool> reLoginResult = await reLogin();
          if (reLoginResult is ApiSuccess<bool>) {
            return _execute(action, hasRetried: true);
          }
        }
        return ApiError<T>(
          GeneralResponse(
            statusCode: tokenExpire,
            message: ap.loginFail,
          ),
        );
      }
      if (e.isNotPermission) {
        return ApiError<T>(
          GeneralResponse(
            statusCode: notPermission,
            message: ap.noPermissionHint,
          ),
        );
      }
      if (e.isNotFoundAnnouncement) {
        return ApiError<T>(
          GeneralResponse(
            statusCode: notFoundData,
            message: ap.notFoundData,
          ),
        );
      }
      return ApiFailure<T>(e);
    }
  }

  Future<ApiResult<T>> _executeAuth<T>(Future<T> Function() action) async {
    try {
      return ApiSuccess<T>(await action());
    } on DioException catch (e) {
      if (e.isUnauthorized) {
        final String message = e.response?.data is String
            ? e.response!.data as String
            : ap.loginFail;
        return ApiError<T>(
          GeneralResponse(statusCode: tokenExpire, message: message),
        );
      }
      return ApiFailure<T>(e);
    }
  }

  // ---------------------------------------------------------------------------
  // Auth
  // ---------------------------------------------------------------------------

  /// Resolves the role using the same credential the moderation API receives.
  Future<ApiResult<PermissionLevel>> getAuthenticatedRole(
    AnnouncementLoginData session,
  ) async {
    try {
      final Response<Map<String, dynamic>> response = await dio.get(
        '/user/info',
        options: Options(
          headers: <String, String>{'Authorization': 'Bearer ${session.key}'},
          followRedirects: false,
        ),
      );
      final Object? level = response.data?['permission_level'];
      if (level is int && level >= 0 && level < PermissionLevel.values.length) {
        return ApiSuccess<PermissionLevel>(PermissionLevel.values[level]);
      }
    } on DioException catch (error) {
      final int? status = error.response?.statusCode;
      if (status != null && (status == 401 || status == 403)) {
        return ApiError<PermissionLevel>(
          GeneralResponse(statusCode: status, message: ''),
        );
      }
      return ApiFailure<PermissionLevel>(error);
    }
    return const ApiError<PermissionLevel>(
      GeneralResponse(statusCode: 500, message: ''),
    );
  }

  Future<ApiResult<bool>> reLogin() async {
    final ApiResult<AnnouncementLoginData> result;
    switch (loginType) {
      case AnnouncementLoginType.normal:
        result = await login(
          username: username,
          password: password,
        );
      case AnnouncementLoginType.google:
        result = await googleLogin(idToken: code);
      case AnnouncementLoginType.apple:
        if (code == null) {
          return const ApiError<bool>(
            GeneralResponse(statusCode: 401, message: ''),
          );
        }
        result = await appleLogin(idToken: code!);
    }
    return switch (result) {
      ApiSuccess<AnnouncementLoginData>(:final AnnouncementLoginData data) =>
        () {
          data.save();
          return const ApiSuccess<bool>(true);
        }(),
      ApiFailure<AnnouncementLoginData>(:final DioException exception) =>
        ApiFailure<bool>(exception),
      ApiError<AnnouncementLoginData>(:final GeneralResponse response) =>
        ApiError<bool>(response),
    };
  }

  Future<ApiResult<AnnouncementLoginData>> login({
    required String? username,
    required String? password,
  }) =>
      _executeAuth(() async {
        final Response<Map<String, dynamic>> response = await dio.post(
          '/login',
          data: <String, String?>{
            'username': username,
            'password': password,
            'fcmToken': fcmToken,
          },
        );
        final AnnouncementLoginData loginData =
            AnnouncementLoginData.fromJson(response.data!);
        setAuthorization(loginData.key);
        this.username = username;
        this.password = password;
        loginType = AnnouncementLoginType.normal;
        return loginData;
      });

  Future<ApiResult<AnnouncementLoginData>> googleLogin({
    required String? idToken,
  }) =>
      _executeAuth(() async {
        final Response<Map<String, dynamic>> response = await dio.post(
          '/oauth2/google/token',
          data: <String, String?>{
            'token': idToken,
            'fcmToken': fcmToken,
          },
        );
        final AnnouncementLoginData loginData =
            AnnouncementLoginData.fromJson(response.data!);
        setAuthorization(loginData.key);
        code = idToken;
        loginType = AnnouncementLoginType.google;
        return loginData;
      });

  Future<ApiResult<AnnouncementLoginData>> appleLogin({
    required String idToken,
  }) =>
      _executeAuth(() async {
        final Response<Map<String, dynamic>> response = await dio.post(
          '/oauth2/apple/token',
          data: <String, String?>{
            'token': idToken,
            'fcmToken': fcmToken,
            'bundleId': appleBundleId,
          },
        );
        final AnnouncementLoginData loginData =
            AnnouncementLoginData.fromJson(response.data!);
        setAuthorization(loginData.key);
        code = idToken;
        loginType = AnnouncementLoginType.apple;
        return loginData;
      });

  // ---------------------------------------------------------------------------
  // Announcements
  // ---------------------------------------------------------------------------

  Future<ApiResult<List<Announcement>>> getAllAnnouncements() =>
      _execute(() async {
        final Response<Map<String, dynamic>> response = await dio.get(
          '/announcements',
        );
        if (response.statusCode == 204) return <Announcement>[];
        final AnnouncementData data =
            AnnouncementData.fromJson(response.data!);
        return data.sortedData;
      });

  Future<ApiResult<List<Announcement>>> getAnnouncements({
    String? locale,
    List<String>? tags,
    bool sorted = true,
  }) =>
      _execute(() async {
        final Response<Map<String, dynamic>> response = await dio.post(
          '/announcements',
          data: <String, dynamic>{
            'tag': tags ?? <String>[],
            'lang': locale ?? 'zh',
          },
        );
        if (response.statusCode == 204) return <Announcement>[];
        final AnnouncementData data =
            AnnouncementData.fromJson(response.data!);
        return sorted ? data.sortedData : data.data;
      });

  Future<ApiResult<Announcement>> getAnnouncement({
    required int id,
  }) =>
      _execute(() async {
        final Response<Map<String, dynamic>> response = await dio.get(
          '/announcements/$id',
        );
        return Announcement.fromJson(
          response.data!['data'] as Map<String, dynamic>,
        );
      });

  Future<ApiResult<Response<dynamic>>> addAnnouncement({
    required Announcement data,
    String? languageCode,
  }) =>
      _execute(() async {
        final List<String> currentTags = (data.tags ?? <String>[]).toList();
        currentTags.addAll(
          <String>[
            languageCode ?? 'zh',
            if (organization != null) organization!,
          ],
        );
        final Announcement dataToSend = data.copyWith(tags: currentTags);
        return dio.post(
          '/announcements/add',
          data: dataToSend.toUpdateJson(),
        );
      });

  Future<ApiResult<Response<dynamic>>> updateAnnouncement({
    required Announcement data,
  }) =>
      _execute(() async {
        return dio.put(
          '/announcements/update/${data.id}',
          data: data.toUpdateJson(),
        );
      });

  Future<ApiResult<Response<dynamic>>> deleteAnnouncement({
    required Announcement data,
  }) =>
      _execute(() async {
        return dio.delete(
          '/announcements/delete/${data.id}',
          data: data.toUpdateJson(),
        );
      });

  // ---------------------------------------------------------------------------
  // Applications
  // ---------------------------------------------------------------------------

  /// Lists submissions belonging to the supplied authenticated account.
  Future<ApiResult<List<Announcement>>> getOwnApplications(
    AnnouncementLoginData session,
  ) async {
    final String? username = session.username;
    if (username == null || username.isEmpty) {
      return const ApiError<List<Announcement>>(
        GeneralResponse(statusCode: 401, message: ''),
      );
    }
    try {
      final Response<Map<String, dynamic>> response = await dio.get(
        '/user/application/${Uri.encodeComponent(username)}',
        options: Options(
          headers: <String, String>{'Authorization': 'Bearer ${session.key}'},
          followRedirects: false,
        ),
      );
      if (response.statusCode == 204) {
        return const ApiSuccess<List<Announcement>>(<Announcement>[]);
      }
      return ApiSuccess<List<Announcement>>(
        AnnouncementData.fromJson(response.data!).sortedData,
      );
    } on DioException catch (error) {
      return ApiFailure<List<Announcement>>(error);
    }
  }

  Future<ApiResult<List<Announcement>>> getApplications() =>
      _execute(() async {
        final Response<Map<String, dynamic>> response = await dio.get(
          '/application',
        );
        if (response.statusCode == 204) return <Announcement>[];
        final AnnouncementData data =
            AnnouncementData.fromJson(response.data!);
        return data.sortedData;
      });

  Future<ApiResult<Announcement>> getApplication({
    required String id,
  }) =>
      _execute(() async {
        final Response<Map<String, dynamic>> response = await dio.get(
          '/application/$id',
        );
        return Announcement.fromJson(response.data!);
      });

  Future<ApiResult<Response<dynamic>>> addApplication({
    required Announcement data,
    String? languageCode,
  }) =>
      _execute(() async {
        final List<String> currentTags = (data.tags ?? <String>[]).toList();
        currentTags.addAll(
          <String>[
            languageCode ?? 'zh',
            if (organization != null) organization!,
          ],
        );
        final Announcement dataToSend = data.copyWith(tags: currentTags);
        return dio.post(
          '/application',
          data: dataToSend.toUpdateJson(),
        );
      });

  Future<ApiResult<Response<dynamic>>> approveApplication({
    required String? applicationId,
    String? reviewDescription,
  }) =>
      _execute(() async {
        return dio.put(
          '/application/$applicationId/approve',
          data: <String, String>{
            'description': reviewDescription ?? '',
          },
        );
      });

  Future<ApiResult<Response<dynamic>>> rejectApplication({
    required String? applicationId,
    String? reviewDescription,
  }) =>
      _execute(() async {
        return dio.put(
          '/application/$applicationId/reject',
          data: <String, String>{
            'description': reviewDescription ?? '',
          },
        );
      });

  Future<ApiResult<Response<dynamic>>> removeApplication({
    required String applicationId,
  }) =>
      _execute(() async {
        return dio.delete('/application/$applicationId');
      });

  Future<ApiResult<Response<dynamic>>> updateApplication({
    required Announcement data,
  }) =>
      _execute(() async {
        return dio.put(
          '/application/${data.applicationId}',
          data: data.toUpdateApplicationJson(),
        );
      });

  // ---------------------------------------------------------------------------
  // Blacklist
  // ---------------------------------------------------------------------------

  Future<ApiResult<List<String>>> getBlackList() => _execute(() async {
        final Response<String> response = await dio.get<String>('/ban');
        final List<dynamic> list =
            jsonDecode(response.data!) as List<dynamic>;
        return list.map((dynamic e) => e as String).toList();
      });

  Future<ApiResult<Response<dynamic>>> addBlackList({
    required String username,
  }) =>
      _execute(() async {
        return dio.post(
          '/ban',
          data: <String, String>{'username': username},
        );
      });

  Future<ApiResult<Response<dynamic>>> removeFromBlackList({
    required String username,
  }) =>
      _execute(() async {
        return dio.delete(
          '/ban',
          data: <String, String>{'username': username},
        );
      });

  // ---------------------------------------------------------------------------
  // Editor Management (Admin only, permission_level >= 2)
  // ---------------------------------------------------------------------------

  Future<ApiResult<List<String>>> getEditorList() => _execute(() async {
        final Response<String> response =
            await dio.get<String>('/auth/editor');
        final List<dynamic> list =
            jsonDecode(response.data!) as List<dynamic>;
        return list.map((dynamic e) => e as String).toList();
      });

  Future<ApiResult<Response<dynamic>>> addEditor({
    required String username,
  }) =>
      _execute(() async {
        return dio.post(
          '/auth/editor',
          data: <String, String>{'username': username},
        );
      });

  Future<ApiResult<Response<dynamic>>> removeEditor({
    required String username,
  }) =>
      _execute(() async {
        return dio.delete(
          '/auth/editor',
          data: <String, String>{'username': username},
        );
      });

  // ---------------------------------------------------------------------------
  // Tag Statistics (public)
  // ---------------------------------------------------------------------------

  Future<ApiResult<Map<String, int>>> getTagsCount() =>
      _execute(() async {
        final Response<String> response =
            await dio.get<String>('/announcements/tags');
        final Map<String, dynamic> map =
            jsonDecode(response.data!) as Map<String, dynamic>;
        return map
            .map((String k, dynamic v) => MapEntry<String, int>(k, v as int));
      });

  // ---------------------------------------------------------------------------
  // Utilities
  // ---------------------------------------------------------------------------

  void setAuthorization(String? key) {
    dio.options.headers['Authorization'] = 'Bearer $key';
  }

  void clearSetting() {
    username = null;
    password = null;
  }
}
