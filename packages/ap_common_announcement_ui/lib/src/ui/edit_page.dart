import 'package:ap_common_announcement_ui/src/api/announcement_helper.dart';
import 'package:ap_common_announcement_ui/src/api/imgbb_helper.dart';
import 'package:ap_common_announcement_ui/src/ui/announcement_edit_form.dart';
import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

enum Mode { add, edit, application, editApplication }

extension ParseDateTimes on DateTime {
  String parseToString() {
    final DateFormat formatter = DateFormat('yyyy-MM-ddTHH:mm:ss');
    final String text = formatter.format(subtract(timeZoneOffset));
    return '${text}Z';
  }
}

class AnnouncementEditPage extends StatefulWidget {
  const AnnouncementEditPage({
    super.key,
    required this.mode,
    this.announcement,
    this.needFetch = false,
    this.blackList = const <String>{},
    this.applicationDescriptionWidget,
    this.organizationDomain,
  });

  static const String routerName = '/news/edit';

  final Mode mode;
  final Announcement? announcement;
  final bool needFetch;
  final Set<String> blackList;

  /// Description widget shown at the top of the application form.
  final Widget? applicationDescriptionWidget;

  /// Organization domain for default description text.
  final String? organizationDomain;

  @override
  _AnnouncementEditPageState createState() =>
      _AnnouncementEditPageState();
}

class _AnnouncementEditPageState extends State<AnnouncementEditPage> {
  final GlobalKey<AnnouncementEditFormState> _formKey =
      GlobalKey<AnnouncementEditFormState>();

  String get pageTitle {
    switch (widget.mode) {
      case Mode.add:
      case Mode.edit:
      case Mode.editApplication:
        return context.ap.announcements;
      case Mode.application:
        return context.ap.addApplication;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.needFetch) {
      _fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ApPageScaffold(
      title: Text(pageTitle),
      body: AnnouncementEditForm(
        key: _formKey,
        mode: widget.mode,
        announcement: widget.announcement,
        blackList: widget.blackList,
        applicationDescriptionWidget:
            widget.applicationDescriptionWidget,
        organizationDomain: widget.organizationDomain,
        onImageUpload: (XFile file) async {
          final ApiResult<String> result =
              await ImgbbHelper.instance!.uploadImage(
            file: file,
          );
          if (!mounted) return null;
          if (result
              case ApiSuccess<String>(:final String data)) {
            return data;
          }
          if (context.mounted) result.showErrorToast(context);
          return null;
        },
        onSubmit: _handleSubmit,
      ),
    );
  }

  Future<void> _fetchData() async {
    final ApiResult<Announcement> result;
    if (widget.mode == Mode.edit) {
      result = await AnnouncementHelper.instance.getAnnouncement(
        id: widget.announcement!.id!,
      );
    } else if (widget.mode == Mode.editApplication) {
      result = await AnnouncementHelper.instance.getApplication(
        id: widget.announcement!.applicationId!,
      );
    } else {
      return;
    }
    if (!mounted) return;
    if (result
        case ApiSuccess<Announcement>(:final Announcement data)) {
      _formKey.currentState?.updateAnnouncement(data);
    } else {
      result.showErrorToast(context);
    }
  }

  Future<void> _handleSubmit(
    Announcement data, {
    bool? isApproval,
    bool? addBlackList,
  }) async {
    final ApiResult<Response<dynamic>> result;
    switch (widget.mode) {
      case Mode.add:
        result = await AnnouncementHelper.instance
            .addAnnouncement(data: data);
      case Mode.edit:
        result = await AnnouncementHelper.instance
            .updateAnnouncement(data: data);
      case Mode.application:
        result = await AnnouncementHelper.instance
            .addApplication(data: data);
      case Mode.editApplication:
        result = await AnnouncementHelper.instance
            .updateApplication(data: data);
    }

    if (!mounted) return;
    if (!result.isSuccess) {
      result.showErrorToast(context);
      return;
    }

    switch (widget.mode) {
      case Mode.add:
        UiUtil.instance
            .showToast(context, context.ap.addSuccess);
      case Mode.edit:
        UiUtil.instance
            .showToast(context, context.ap.updateSuccess);
      case Mode.application:
        UiUtil.instance.showToast(
          context,
          context.ap.applicationSubmitSuccess,
        );
      case Mode.editApplication:
        UiUtil.instance
            .showToast(context, context.ap.updateSuccess);
        if (isApproval != null) {
          final ApiResult<Response<dynamic>> reviewResult;
          if (isApproval) {
            reviewResult = await AnnouncementHelper.instance
                .approveApplication(
              applicationId: data.applicationId,
              reviewDescription: data.reviewDescription,
            );
          } else {
            reviewResult = await AnnouncementHelper.instance
                .rejectApplication(
              applicationId: data.applicationId,
              reviewDescription: data.reviewDescription,
            );
          }
          if (!mounted) return;
          if (!reviewResult.isSuccess) {
            reviewResult.showErrorToast(context);
            return;
          }
        }
        if (addBlackList ?? false) {
          final ApiResult<Response<dynamic>> banResult =
              await AnnouncementHelper.instance.addBlackList(
            username: data.applicant!,
          );
          if (!mounted) return;
          if (!banResult.isSuccess) {
            banResult.showErrorToast(context);
            return;
          }
        }
    }
    if (!mounted) return;
    Navigator.of(context).pop(true);
  }
}
