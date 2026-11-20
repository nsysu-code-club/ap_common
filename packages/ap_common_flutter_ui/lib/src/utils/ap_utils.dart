import 'dart:io';

import 'package:ap_common_flutter_core/ap_common_flutter_core.dart';
import 'package:ap_common_flutter_ui/src/widgets/yes_no_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

export 'toast.dart';

class ApUtils {
  static bool get isSupportCacheNetworkImage =>
      kIsWeb || Platform.isAndroid || Platform.isIOS || Platform.isMacOS;

  static void pushCupertinoStyle(
    BuildContext context,
    Widget page,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }

  static Future<void> launchFbFansPage(
    BuildContext context,
    String fansPageId,
  ) async {
    final String fansPageUrl = 'https://www.facebook.com/$fansPageId/';
    if (Platform.isAndroid) {
      PlatformUtil.instance.launchUrl('fb://messaging/$fansPageId').catchError(
            (dynamic onError) => PlatformUtil.instance.launchUrl(fansPageUrl),
          );
    } else if (Platform.isIOS) {
      PlatformUtil.instance
          .launchUrl('fb-messenger://user-thread/$fansPageId')
          .catchError(
            (dynamic onError) => PlatformUtil.instance.launchUrl(fansPageUrl),
          );
    } else {
      PlatformUtil.instance.launchUrl(fansPageUrl).catchError(
        (dynamic onError) {
          if (!context.mounted) return;
          UiUtil.instance.showToast(
            context,
            context.ap.platformError,
          );
        },
      );
    }
  }

  static Future<void> showAppReviewDialog(
    BuildContext context,
    String defaultUrl,
  ) async {
    final ApLocalizations app = context.ap;
    await Future<void>.delayed(const Duration(seconds: 1));
    //ignore: use_build_context_synchronously
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (BuildContext context) => YesNoDialog(
        title: app.ratingDialogTitle,
        contentWidget: Text(
          app.ratingDialogContent,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.3,
            fontSize: 16.0,
          ),
        ),
        leftActionText: app.later,
        rightActionText: app.rateNow,
        rightActionFunction: () => AppStoreUtil.instance.openAppReview(
          defaultUrl: defaultUrl,
        ),
      ),
    );
  }

  static Future<void> showAppReviewSheet(
    BuildContext context,
    String defaultUrl,
  ) async {
    // await Future.delayed(Duration(seconds: 1));
    final ApLocalizations app = context.ap;
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      backgroundColor: const Color(0x00000000),
      isScrollControlled: true,
      builder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Align(
                child: Text(
                  app.ratingDialogTitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.3,
                  fontSize: 18.0,
                ),
                children: <TextSpan>[
                  TextSpan(text: app.ratingDialogContent),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    app.later,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => AppStoreUtil.instance.openAppReview(
                    defaultUrl: defaultUrl,
                  ),
                  child: Text(
                    app.rateNow,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
