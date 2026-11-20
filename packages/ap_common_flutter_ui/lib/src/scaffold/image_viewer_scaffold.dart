import 'package:ap_common_flutter_ui/src/scaffold/ap_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer {
  ImageViewer({
    required this.title,
    required this.assetName,
  });

  final String title;
  final String assetName;
}

class ImageViewerScaffold extends StatefulWidget {
  const ImageViewerScaffold({
    super.key,
    this.title,
    required this.imageViewers,
    this.actions,
  });

  final String? title;
  final List<ImageViewer> imageViewers;
  final List<Widget>? actions;

  @override
  _ImageViewerScaffoldState createState() => _ImageViewerScaffoldState();
}

class _ImageViewerScaffoldState extends State<ImageViewerScaffold>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: widget.imageViewers.length,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ApPageScaffold(
      title: Text(widget.title ?? ''),
      actions: widget.actions ?? const <Widget>[],
      bottom: (widget.imageViewers.length > 1)
          ? TabBar(
              controller: _tabController,
              tabs: <Tab>[
                for (final ImageViewer image in widget.imageViewers)
                  Tab(
                    text: image.title,
                  ),
              ],
            )
          : null,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          for (final ImageViewer image in widget.imageViewers)
            PhotoView(
              imageProvider: AssetImage(image.assetName),
            ),
        ],
      ),
    );
  }
}
