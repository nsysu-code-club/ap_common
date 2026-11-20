import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

enum NotificationState { loading, finish, loadingMore, error, empty, offline }

class NotificationListView extends StatefulWidget {
  const NotificationListView({
    super.key,
    required this.state,
    required this.notificationList,
    required this.onRefresh,
    this.onLoadingMore,
  });

  final NotificationState state;
  final List<Notifications> notificationList;
  final Future<void> Function() onRefresh;
  final Future<void> Function()? onLoadingMore;

  @override
  NotificationListViewState createState() => NotificationListViewState();
}

class NotificationListViewState extends State<NotificationListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScrollController? controller;

  @override
  void initState() {
    AnalyticsUtil.instance.setCurrentScreen(
      'NotificationListView',
      'notification_list_view.dart',
    );
    controller = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.removeListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  Widget _body() {
    switch (widget.state) {
      case NotificationState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case NotificationState.error:
      case NotificationState.empty:
        return InkWell(
          onTap: () {
            widget.onRefresh.call();
            AnalyticsUtil.instance.logEvent(AnalyticsConstants.refresh);
          },
          child: HintContent(
            icon: ApIcon.assignment,
            content: widget.state == NotificationState.error
                ? context.ap.clickToRetry
                : context.ap.clickToRetry,
          ),
        );
      case NotificationState.offline:
        return HintContent(
          icon: ApIcon.offlineBolt,
          content: context.ap.offlineMode,
        );
      default:
        return RefreshIndicator(
          onRefresh: widget.onRefresh,
          child: ListView.builder(
            padding: ApAppShell.contentPadding(
              context,
              spacing: const EdgeInsets.only(bottom: 16),
            ),
            controller: controller,
            itemBuilder: (BuildContext context, int index) {
              return NotificationItem(
                notification: widget.notificationList[index],
              );
            },
            itemCount: widget.notificationList.length,
          ),
        );
    }
  }

  void _scrollListener() {
    if (controller!.position.extentAfter < 500) {
      if (widget.state == NotificationState.finish) {
        widget.onLoadingMore?.call();
        AnalyticsUtil.instance.logEvent('notification_load_more');
      }
    }
  }
}
