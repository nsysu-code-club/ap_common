import 'package:ap_common/ap_common.dart';
import 'package:ap_common_example/utils/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key, this.submissionOnly = false});

  final bool submissionOnly;

  @override
  Widget build(BuildContext context) => AnnouncementReviewPage(
        submissionOnly: submissionOnly,
        // The example does not ship an iOS OAuth client or callback scheme.
        googleSignInUnavailableMessage:
            !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS
                ? context.app.exampleGoogleSignInUnavailable
                : null,
      );
}
