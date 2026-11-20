import 'package:ap_common_announcement_ui/src/api/announcement_helper.dart';
import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

class BlackListPage extends StatefulWidget {
  const BlackListPage({super.key});

  @override
  State<BlackListPage> createState() => _BlackListPageState();
}

class _BlackListPageState extends State<BlackListPage> {
  DataState<List<String>> state =
      const DataLoading<List<String>>();

  final TextEditingController _usernameController =
      TextEditingController();

  @override
  void initState() {
    Future<dynamic>.microtask(() => _getData());
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ApPageScaffold(
      title: Text(context.ap.blackList),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(colorScheme),
        child: const Icon(Icons.person_add_alt),
      ),
      body: switch (state) {
        DataLoading<List<String>>() => const Center(
            child: CircularProgressIndicator(),
          ),
        DataError<List<String>>() => InkWell(
            onTap: _getData,
            child: HintContent(
              icon: ApIcon.classIcon,
              content: context.ap.clickToRetry,
            ),
          ),
        DataEmpty<List<String>>() => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer
                        .withAlpha(77),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.person_off_outlined,
                    size: 40,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  context.ap.noData,
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        DataLoaded<List<String>>(:final List<String> data) =>
          ListView.builder(
            padding: ApAppShell.contentPadding(context),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(
                colorScheme,
                data[index],
                isLast: index == data.length - 1,
              );
            },
          ),
      },
    );
  }

  Widget _buildItem(
    ColorScheme colorScheme,
    String username, {
    bool isLast = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant.withAlpha(77),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colorScheme.errorContainer.withAlpha(128),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.person_off_outlined,
            size: 20,
            color: colorScheme.error,
          ),
        ),
        title: Text(
          username,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
        ),
        trailing: IconButton(
          onPressed: () =>
              _showRemoveDialog(colorScheme, username),
          icon: Icon(
            Icons.delete_outline,
            color: colorScheme.error,
          ),
          tooltip: context.ap.delete,
        ),
      ),
    );
  }

  void _showAddDialog(ColorScheme colorScheme) {
    _usernameController.clear();
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: Text(context.ap.blackList),
        content: TextField(
          controller: _usernameController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: context.ap.account,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          onSubmitted: (_) {
            Navigator.of(dialogContext).pop();
            _addToBlackList();
          },
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(context.ap.back),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _addToBlackList();
            },
            child: Text(context.ap.confirm),
          ),
        ],
      ),
    );
  }

  void _showRemoveDialog(
    ColorScheme colorScheme,
    String username,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: Text(context.ap.delete),
        content: Text(
          '${context.ap.deleteNewsContent}\n$username',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(context.ap.back),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.error,
              foregroundColor: colorScheme.onError,
            ),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _removeFromBlackList(username: username);
            },
            child: Text(context.ap.delete),
          ),
        ],
      ),
    );
  }

  Future<void> _getData() async {
    setState(
      () => state = const DataLoading<List<String>>(),
    );
    final ApiResult<List<String>> result =
        await AnnouncementHelper.instance.getBlackList();
    if (!mounted) return;
    switch (result) {
      case ApiSuccess<List<String>>(:final List<String> data):
        setState(() {
          if (data.isEmpty) {
            state = const DataEmpty<List<String>>();
          } else {
            state = DataLoaded<List<String>>(data);
          }
        });
      case ApiError<List<String>>():
      case ApiFailure<List<String>>():
        result.showErrorToast(context);
        setState(
          () => state = const DataError<List<String>>(),
        );
    }
  }

  Future<void> _addToBlackList() async {
    final String username = _usernameController.text.trim();
    if (username.isEmpty) {
      UiUtil.instance
          .showToast(context, context.ap.doNotEmpty);
      return;
    }
    _showLoading();
    final ApiResult<Response<dynamic>> result =
        await AnnouncementHelper.instance.addBlackList(
      username: username,
    );
    if (!mounted) return;
    _dismissLoading();
    if (result.isSuccess) {
      UiUtil.instance
          .showToast(context, context.ap.addSuccess);
      _getData();
    } else {
      result.showErrorToast(context);
    }
  }

  Future<void> _removeFromBlackList({
    required String username,
  }) async {
    _showLoading();
    final ApiResult<Response<dynamic>> result =
        await AnnouncementHelper.instance.removeFromBlackList(
      username: username,
    );
    if (!mounted) return;
    _dismissLoading();
    if (result.isSuccess) {
      UiUtil.instance
          .showToast(context, context.ap.deleteSuccess);
      _getData();
    } else {
      result.showErrorToast(context);
    }
  }

  void _showLoading() {
    showDialog(
      context: context,
      builder: (_) => PopScope(
        canPop: false,
        child: ProgressDialog(context.ap.loading),
      ),
      barrierDismissible: false,
    );
  }

  void _dismissLoading() {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
