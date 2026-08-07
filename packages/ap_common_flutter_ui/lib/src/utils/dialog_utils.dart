import 'dart:convert';
import 'dart:io';

import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sprintf/sprintf.dart';

class DialogUtils {
  static void showDefault({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    final ApLocalizations l10n = context.ap;
    showDialog(
      context: context,
      builder: (BuildContext context) => DefaultDialog(
        title: title,
        contentWidget: Text(
          content,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.3,
            fontSize: 16.0,
          ),
        ),
        actionText: l10n.iKnow,
        actionFunction: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    );
  }

  static void showAnnouncementRule({
    required BuildContext context,
    required Function() onRightButtonClick,
  }) {
    final ApLocalizations l10n = context.ap;
    showDialog(
      context: context,
      builder: (BuildContext context) => YesNoDialog(
        title: l10n.newsRuleTitle,
        contentWidget: SelectableText.rich(
          TextSpan(
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 16.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: l10n.newsRuleDescription1(arg1: ''),
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
              TextSpan(
                text: l10n.newsRuleDescription2,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: l10n.newsRuleDescription3,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        leftActionText: l10n.cancel,
        rightActionText: l10n.contactFansPage,
        leftActionFunction: () {},
        rightActionFunction: onRightButtonClick,
      ),
    );
  }

  static void showUpdateContent(BuildContext context, String content) {
    final ApLocalizations l10n = context.ap;
    showDialog(
      context: context,
      builder: (BuildContext context) => DefaultDialog(
        title: l10n.updateNoteTitle,
        contentWidget: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        actionText: l10n.iKnow,
        actionFunction: () => Navigator.of(context).pop(),
      ),
    );
  }

  static Future<void> showNewVersionContent({
    required BuildContext context,
    required VersionInfo versionInfo,
    required String appName,
    required String iOSAppId,
    required String defaultUrl,
    String? snapStoreId,
    String? windowsPath,
    String? githubRepositoryName,
    String? githubBranchName,
  }) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (!context.mounted) return;
    final ApLocalizations app = context.ap;
    final int versionDiff =
        versionInfo.code - int.parse(packageInfo.buildNumber);
    final String versionName = 'v${versionInfo.code ~/ 10000}.'
        '${versionInfo.code % 1000 ~/ 100}.'
        '${versionInfo.code % 100}';
    VersionInfo resolvedVersionInfo = versionInfo;
    String url = '';
    if (Platform.isAndroid) {
      url = 'market://details?id=${packageInfo.packageName}';
    } else if (Platform.isIOS || Platform.isMacOS) {
      url = 'itms-apps://itunes.apple.com/tw/app/apple-store/$iOSAppId?mt=8';
    } else if (Platform.isLinux && snapStoreId != null) {
      url = 'https://snapcraft.io/$snapStoreId';
    } else if (Platform.isWindows && windowsPath != null) {
      url = sprintf(
        windowsPath,
        <String>[
          versionName,
        ],
      );
    } else {
      url = defaultUrl;
    }
    if (githubRepositoryName != null) {
      // ignore: always_specify_types
      final Response response = await Dio().get(
        sprintf(
          'https://raw.githubusercontent.com/%s/%s/changelog.json',
          <String>[
            githubRepositoryName,
            githubBranchName ?? 'master',
          ],
        ),
        options: Options(responseType: ResponseType.plain),
      );
      final Map<String, dynamic> json =
          jsonDecode(response.data as String) as Map<String, dynamic>;
      final Map<String, dynamic> versionMap =
          json['${versionInfo.code}'] as Map<String, dynamic>;
      final Object? localeContent = versionMap[app.locale];
      final String content = switch (localeContent) {
        final List<dynamic> list => list.map((Object? e) => '• $e').join('\n'),
        final String s => s,
        _ => versionInfo.content,
      };
      resolvedVersionInfo = versionInfo.copyWith(content: content);
    }
    if (!context.mounted) return;
    final String versionContent =
        '${'\n$versionName\n'}${resolvedVersionInfo.content}';
    final String updateContent = app.updateContent(arg1: appName);
    final RichText contentWidget = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          height: 1.3,
          fontSize: 16.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$updateContent\n'
                '${versionContent.replaceAll('\\n', '\n')}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
    if (versionDiff > 0) {
      if (resolvedVersionInfo.isForceUpdate) {
        //ignore: use_build_context_synchronously
        if (!context.mounted) return;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => PopScope(
            canPop: false,
            child: DefaultDialog(
              title: app.updateTitle,
              actionText: app.update,
              contentWidget: contentWidget,
              actionFunction: () => PlatformUtil.instance.launchUrl(url),
            ),
          ),
        );
      } else {
        //ignore: use_build_context_synchronously
        if (!context.mounted) return;
        showDialog(
          context: context,
          builder: (BuildContext context) => YesNoDialog(
            title: app.updateTitle,
            contentWidget: contentWidget,
            leftActionText: app.skip,
            rightActionText: app.update,
            rightActionFunction: () => PlatformUtil.instance.launchUrl(url),
          ),
        );
      }
    }
  }
}
