import 'package:ap_common_flutter_core/ap_common_flutter_core.dart';
import 'package:ap_common_flutter_ui/src/scaffold/ap_page_scaffold.dart';
import 'package:flutter/material.dart';

/// Shared scrollable layout for an app's More destination.
///
/// Apps provide sections and entries with their own navigation callbacks.
class ApMoreContent extends StatelessWidget {
  const ApMoreContent({
    super.key,
    required this.title,
    required this.isLogin,
    required this.userInfo,
    required this.onAvatarTap,
    this.displayPicture = true,
    this.subtitle,
    this.sections = const <Widget>[],
    this.additionalEntries = const <Widget>[],
  });

  final String title;
  final String? subtitle;
  final bool isLogin;
  final UserInfo? userInfo;
  final bool displayPicture;
  final VoidCallback onAvatarTap;
  final List<Widget> sections;
  final List<Widget> additionalEntries;

  @override
  Widget build(BuildContext context) {
    return ApPageScaffold.scrollable(
      title: title,
      subtitle: subtitle,
      isLogin: isLogin,
      userInfo: userInfo,
      displayPicture: displayPicture,
      onAvatarTap: onAvatarTap,
      children: <Widget>[
        ...sections,
        ...additionalEntries,
      ],
    );
  }
}
