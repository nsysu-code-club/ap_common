import 'package:ap_common/ap_common.dart';
import 'package:ap_common_example/utils/app_localizations.dart';
import 'package:flutter/material.dart';

class CampusPage extends StatelessWidget {
  final bool isLogin;
  final UserInfo? userInfo;
  final bool displayPicture;
  final VoidCallback onAvatarTap;
  final VoidCallback onOpenSchoolInfo;
  final VoidCallback onOpenAnnouncementReview;
  final VoidCallback onOpenSettings;
  final VoidCallback onOpenAbout;
  final List<Widget> additionalEntries;

  const CampusPage({
    super.key,
    required this.isLogin,
    required this.userInfo,
    required this.displayPicture,
    required this.onAvatarTap,
    required this.onOpenSchoolInfo,
    required this.onOpenAnnouncementReview,
    required this.onOpenSettings,
    required this.onOpenAbout,
    this.additionalEntries = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return ApMoreContent(
      title: context.app.tabMore,
      isLogin: isLogin,
      userInfo: userInfo,
      displayPicture: displayPicture,
      onAvatarTap: onAvatarTap,
      sections: <Widget>[
        AppleGroupedSection(
          title: app.campusServicesSection,
          children: <Widget>[
            AppleGroupedTile(
              icon: ApIcon.info,
              title: ap.schoolInfo,
              subtitle: app.schoolInfoSubtitle,
              onTap: onOpenSchoolInfo,
            ),
            AppleGroupedTile(
              icon: ApIcon.edit,
              title: ap.announcementReviewSystem,
              subtitle: app.announcementReviewSubtitle,
              onTap: onOpenAnnouncementReview,
            ),
          ],
        ),
        AppleGroupedSection(
          title: app.appSection,
          children: <Widget>[
            AppleGroupedTile(
              icon: ApIcon.settings,
              title: ap.settings,
              onTap: onOpenSettings,
            ),
            AppleGroupedTile(
              icon: ApIcon.face,
              title: ap.about,
              onTap: onOpenAbout,
            ),
            ...additionalEntries,
          ],
        ),
      ],
    );
  }
}
