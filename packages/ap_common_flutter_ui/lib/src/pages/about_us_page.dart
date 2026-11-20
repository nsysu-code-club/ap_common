import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({
    super.key,
    required this.assetImage,
    required this.fbFanPageUrl,
    required this.fbFanPageId,
    this.instagramUsername,
    required this.githubUrl,
    required this.githubName,
    required this.email,
    required this.appLicense,
    this.actions,
    this.applicationName,
    this.applicationVersion,
    this.applicationIcon,
    this.applicationLegalese,
  });

  /// /about
  static const String routerName = '/about';
  final String assetImage;
  final String fbFanPageUrl;
  final String fbFanPageId;
  final String? instagramUsername;
  final String githubUrl;
  final String githubName;
  final String email;
  final String appLicense;
  final String? applicationName;
  final String? applicationVersion;
  final Widget? applicationIcon;
  final String? applicationLegalese;
  final List<Widget>? actions;

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  void initState() {
    AnalyticsUtil.instance.setCurrentScreen(
      'AboutUsPage',
      'about_us_page.dart',
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).colorScheme.onSurface;
    return ApPageScaffold(
      title: Text(context.ap.about),
      actions: <Widget>[
        ...widget.actions ?? <Widget>[],
        IconButton(
          icon: Icon(ApIcon.codeIcon),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => LicensePage(
                  applicationName: widget.applicationName,
                  applicationVersion: widget.applicationVersion,
                  applicationIcon: widget.applicationIcon,
                  applicationLegalese: widget.applicationLegalese,
                ),
              ),
            );
            AnalyticsUtil.instance.logEvent('license_page_click');
          },
        ),
      ],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    widget.assetImage,
                    fit: BoxFit.cover,
                    excludeFromSemantics: true,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: ApAppShell.contentPadding(context).bottom,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  AboutInfoCard(
                    title: context.ap.aboutAuthorTitle,
                    content: context.ap.aboutAuthorContent,
                  ),
                  AboutInfoCard(
                    title: context.ap.about,
                    content: context.ap.aboutUsContent,
                  ),
                  AboutInfoCard(
                    title: context.ap.aboutRecruitTitle,
                    content: context.ap.aboutRecruitContent,
                  ),
                  Stack(
                    children: <Widget>[
                      AboutInfoCard(
                        title: context.ap.aboutItcTitle,
                        content: context.ap.aboutItcContent,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 26.0,
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            ApImageAssets.nkutstItc,
                            width: 64.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      AboutInfoCard(
                        title: context.ap.aboutNsysuCodeClubTitle,
                        content: context.ap.aboutNsysuCodeClubContent,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 26.0,
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            ApImageAssets.nsysuGdsc,
                            width: 64.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 24.0,
                        left: 16.0,
                        bottom: 16.0,
                        right: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SelectableText(
                            context.ap.aboutContactUsTitle,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Image.asset(
                                    ApImageAssets.fb,
                                    color: iconColor,
                                  ),
                                  onPressed: () {
                                    PlatformUtil.instance.launchUrl(
                                      'https://m.me/${widget.fbFanPageId}',
                                    );
                                    AnalyticsUtil.instance.logEvent('fb_click');
                                  },
                                  iconSize: 48.0,
                                ),
                                if (widget.instagramUsername
                                    case final String username?)
                                  IconButton(
                                    icon: Image.asset(ApImageAssets.instagram),
                                    onPressed: () {
                                      PlatformUtil.instance.launchUrl(
                                        'https://ig.me/m/$username',
                                      );
                                      AnalyticsUtil.instance
                                          .logEvent('instagram_click');
                                    },
                                    iconSize: 48.0,
                                  ),
                                IconButton(
                                  icon: Image.asset(
                                    ApImageAssets.github,
                                    color: iconColor,
                                  ),
                                  onPressed: () {
                                    PlatformUtil.instance
                                        .launchUrl(widget.githubUrl)
                                        .catchError(
                                      (dynamic onError) {
                                        if (!context.mounted) return;
                                        UiUtil.instance.showToast(
                                          context,
                                          context.ap.platformError,
                                        );
                                      },
                                    );
                                    AnalyticsUtil.instance
                                        .logEvent('github_click');
                                  },
                                  iconSize: 48.0,
                                ),
                                IconButton(
                                  icon: Image.asset(
                                    ApImageAssets.email,
                                    color: iconColor,
                                  ),
                                  onPressed: () {
                                    PlatformUtil.instance
                                        .launchUrl('mailto:${widget.email}')
                                        .catchError(
                                      (dynamic onError) {
                                        if (!context.mounted) return;
                                        UiUtil.instance.showToast(
                                          context,
                                          context.ap.platformError,
                                        );
                                      },
                                    );
                                    AnalyticsUtil.instance
                                        .logEvent('email_click');
                                  },
                                  iconSize: 48.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AboutInfoCard(
                    title: context.ap.aboutOpenSourceTitle,
                    content: widget.appLicense,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
