import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

enum PhoneState { loading, finish, error }

class PhoneListView extends StatefulWidget {
  const PhoneListView({
    super.key,
    required this.state,
    required this.phoneModelList,
  });

  final PhoneState state;
  final List<PhoneModel> phoneModelList;

  static const String routerName = '/info/phone';

  @override
  PhoneListViewState createState() => PhoneListViewState();
}

class PhoneListViewState extends State<PhoneListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    AnalyticsUtil.instance.setCurrentScreen(
      'PhoneListView',
      'phone_list_view.dart',
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  Widget _body() {
    final Map<PhoneModel?, List<PhoneModel>> phoneGroup =
        <PhoneModel, List<PhoneModel>>{};
    PhoneModel? lastHeader;
    for (int i = 0; i < widget.phoneModelList.length; i++) {
      if (widget.phoneModelList[i].number.isEmpty) {
        phoneGroup[widget.phoneModelList[i]] = <PhoneModel>[];
        lastHeader = widget.phoneModelList[i];
      } else {
        phoneGroup[lastHeader]?.add(widget.phoneModelList[i]);
      }
    }
    switch (widget.state) {
      case PhoneState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case PhoneState.error:
        return HintContent(
          icon: ApIcon.assignment,
          content: context.ap.clickToRetry,
        );
      default:
        return CustomScrollView(
          slivers: <Widget>[
            for (final MapEntry<PhoneModel?, List<PhoneModel>> entries
                in phoneGroup.entries)
              SliverMainAxisGroup(
                slivers: <Widget>[
                  if (entries.key != null)
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: HeaderDelegate(entries.key!.name),
                    ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: DecoratedSliver(
                      decoration: const BoxDecoration(
                        color: Color(0x00000000),
                        borderRadius: BorderRadius.zero,
                      ),
                      sliver: SliverList.separated(
                        itemBuilder: (_, int index) => PhoneListItem(
                          phone: entries.value[index],
                        ),
                        separatorBuilder: (_, __) =>
                            const Divider(indent: 8, endIndent: 8),
                        itemCount: entries.value.length,
                      ),
                    ),
                  ),
                ],
              ),
            SliverPadding(
              padding: ApAppShell.contentPadding(
                context,
                spacing: const EdgeInsets.only(bottom: 8),
              ),
            ),
          ],
        );
    }
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  const HeaderDelegate(this.title);

  final String title;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: minExtent,
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: colorScheme.primary,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
