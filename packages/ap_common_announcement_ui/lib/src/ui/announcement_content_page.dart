import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:photo_view/photo_view.dart';

class AnnouncementContentPage extends StatefulWidget {
  const AnnouncementContentPage({
    super.key,
    required this.announcement,
  });

  final Announcement announcement;

  @override
  AnnouncementContentPageState createState() =>
      AnnouncementContentPageState();
}

class AnnouncementContentPageState
    extends State<AnnouncementContentPage> {
  @override
  void initState() {
    AnalyticsUtil.instance.setCurrentScreen(
      'AnnouncementContentPage',
      'announcement_content_page.dart',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApPageScaffold(
      title: Text(context.ap.announcements),
      body: OrientationBuilder(
        builder: (_, Orientation orientation) {
          return orientation == Orientation.portrait
              ? SingleChildScrollView(
                  padding: ApAppShell.contentPadding(
                    context,
                    spacing: const EdgeInsets.only(bottom: 16),
                  ),
                  child: Column(
                    children: _renderContent(orientation),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _renderContent(orientation),
                );
        },
      ),
    );
  }

  List<Widget> _renderContent(Orientation orientation) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Widget image = GestureDetector(
      onTap: () {
        ApUtils.pushCupertinoStyle(
          context,
          ApPageScaffold(
            title: Text(widget.announcement.title),
            body: PhotoView(
              imageProvider: (ApUtils.isSupportCacheNetworkImage
                      ? CachedNetworkImageProvider(
                          widget.announcement.imgUrl,
                        )
                      : NetworkImage(widget.announcement.imgUrl))
                  as ImageProvider<Object>?,
            ),
          ),
        );
        AnalyticsUtil.instance
            .logEvent('announcement_content_image_click');
      },
      child: AspectRatio(
        aspectRatio:
            orientation == Orientation.portrait ? 4 / 3 : 9 / 16,
        child: Hero(
          tag: widget.announcement.hashCode,
          child: ApNetworkImage(
            url: widget.announcement.imgUrl,
          ),
        ),
      ),
    );
    final List<Widget> content = <Widget>[
      Hero(
        tag: ApConstants.tagAnnouncementTitle,
        child: Material(
          color: Colors.transparent,
          child: SelectableText(
            widget.announcement.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      Hero(
        tag: ApConstants.tagAnnouncementIcon,
        child: Icon(
          ApIcon.arrowDropDown,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              orientation == Orientation.portrait ? 16.0 : 0.0,
        ),
        child: SelectableLinkify(
          text: widget.announcement.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: colorScheme.onSurfaceVariant,
          ),
          linkStyle: TextStyle(
            color: colorScheme.primary,
          ),
          options: const LinkifyOptions(humanize: false),
          onOpen: (LinkableElement link) =>
              PlatformUtil.instance.launchUrl(link.url),
        ),
      ),
      if (widget.announcement.url != null &&
          widget.announcement.url!.isNotEmpty) ...<Widget>[
        const SizedBox(height: 16.0),
        FilledButton(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 32.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            PlatformUtil.instance
                .launchUrl(widget.announcement.url!);
            AnalyticsUtil.instance
                .logEvent('announcement_link_click');
          },
          child: Icon(ApIcon.exitToApp),
        ),
      ],
    ];
    if (orientation == Orientation.portrait) {
      return <Widget>[
        const SizedBox(height: 16.0),
        image,
        const SizedBox(height: 16.0),
        ...content,
      ];
    } else {
      return <Widget>[
        const SizedBox(width: 16.0),
        Expanded(child: image),
        const SizedBox(width: 32.0),
        Expanded(
          child: SingleChildScrollView(
            padding: ApAppShell.contentPadding(
              context,
              spacing: const EdgeInsets.only(bottom: 16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: content,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
      ];
    }
  }
}
