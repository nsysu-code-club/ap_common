import 'package:ap_common_announcement_ui/src/api/announcement_helper.dart';
import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditorListPage extends StatefulWidget {
  const EditorListPage({super.key});

  @override
  State<EditorListPage> createState() => _EditorListPageState();
}

class _EditorListPageState extends State<EditorListPage> {
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
      title: Text(context.ap.editorList),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(colorScheme),
        child: const Icon(Icons.person_add_alt_1),
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
                    Icons.edit_outlined,
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
            color: colorScheme.primaryContainer.withAlpha(128),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.edit_outlined,
            size: 20,
            color: colorScheme.primary,
          ),
        ),
        title: Text(
          username,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(text: username),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(username),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(
                Icons.copy,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
              tooltip: username,
            ),
            IconButton(
              onPressed: () =>
                  _showRemoveDialog(colorScheme, username),
              icon: Icon(
                Icons.delete_outline,
                color: colorScheme.error,
              ),
              tooltip: context.ap.delete,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDialog(ColorScheme colorScheme) {
    _usernameController.clear();
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: Text(context.ap.editorList),
        content: TextField(
          controller: _usernameController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: context.ap.account,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          onSubmitted: (_) {
            Navigator.of(dialogContext).pop();
            _addEditor();
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
              _addEditor();
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
              _removeEditor(username: username);
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
        await AnnouncementHelper.instance.getEditorList();
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

  Future<void> _addEditor() async {
    final String username = _usernameController.text.trim();
    if (username.isEmpty) {
      UiUtil.instance
          .showToast(context, context.ap.doNotEmpty);
      return;
    }
    final ApiResult<Response<dynamic>> result =
        await AnnouncementHelper.instance.addEditor(
      username: username,
    );
    if (!mounted) return;
    if (result.isSuccess) {
      UiUtil.instance
          .showToast(context, context.ap.addSuccess);
      _getData();
    } else {
      result.showErrorToast(context);
    }
  }

  Future<void> _removeEditor({
    required String username,
  }) async {
    final ApiResult<Response<dynamic>> result =
        await AnnouncementHelper.instance.removeEditor(
      username: username,
    );
    if (!mounted) return;
    if (result.isSuccess) {
      UiUtil.instance
          .showToast(context, context.ap.deleteSuccess);
      _getData();
    } else {
      result.showErrorToast(context);
    }
  }
}
