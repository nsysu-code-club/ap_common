import 'package:ap_common/ap_common.dart';
import 'package:ap_common_example/utils/app_localizations.dart';
import 'package:flutter/material.dart';

/// Demonstrates the bus layout with sample routes.
class BusPage extends StatelessWidget {
  const BusPage({
    super.key,
    required this.isLogin,
    required this.userInfo,
    required this.displayPicture,
    required this.onAvatarTap,
  });

  final bool isLogin;
  final UserInfo? userInfo;
  final bool displayPicture;
  final VoidCallback onAvatarTap;

  @override
  Widget build(BuildContext context) {
    return ApPageScaffold.scrollable(
      title: context.ap.bus,
      subtitle: context.app.busDemoSubtitle,
      isLogin: isLogin,
      userInfo: userInfo,
      displayPicture: displayPicture,
      onAvatarTap: onAvatarTap,
      children: <Widget>[
        AppleGroupedSection(
          title: context.app.busRoutesSection,
          children: <Widget>[
            for (final String route in <String>[
              context.app.busFromJiangong,
              context.app.busFromYanchao,
            ])
              AppleGroupedTile(
                icon: ApIcon.directionsBus,
                title: route,
                subtitle: context.app.busDemoSubtitle,
                onTap: () => Navigator.of(context).push<void>(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ApPageScaffold(
                      title: Text(route),
                      body: ListView(
                        padding: ApAppShell.contentPadding(context),
                        children: <Widget>[
                          Text(context.app.busDemoSubtitle),
                          for (final String time in <String>[
                            '08:00',
                            '12:00',
                            '17:00',
                          ])
                            ListTile(
                              leading: Icon(ApIcon.accessTime),
                              title: Text(time),
                              subtitle: Text(route),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
