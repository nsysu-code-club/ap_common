import 'package:ap_common_announcement_ui/src/ui/edit_page.dart';
import 'package:ap_common_announcement_ui/src/utils/tag_colors.dart';
import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ImageUploadState { noFile, uploading, done }

/// A reusable announcement edit form that handles form state internally
/// and delegates submission and image upload via callbacks.
class AnnouncementEditForm extends StatefulWidget {
  const AnnouncementEditForm({
    super.key,
    required this.mode,
    required this.onSubmit,
    this.announcement,
    this.onImageUpload,
    this.blackList = const <String>{},
    this.applicationDescriptionWidget,
    this.organizationDomain,
  });

  final Mode mode;
  final Announcement? announcement;
  final Set<String> blackList;

  /// Called when the user taps submit. Receives the built [Announcement]
  /// and optional review actions for [Mode.editApplication].
  final Future<void> Function(
    Announcement data, {
    bool? isApproval,
    bool? addBlackList,
  }) onSubmit;

  /// Called to upload an image. Should return the uploaded URL,
  /// or null if upload was cancelled/failed.
  final Future<String?> Function(XFile file)? onImageUpload;

  final Widget? applicationDescriptionWidget;
  final String? organizationDomain;

  @override
  State<AnnouncementEditForm> createState() =>
      AnnouncementEditFormState();
}

class AnnouncementEditFormState extends State<AnnouncementEditForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Announcement _announcement;

  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _imgUrl = TextEditingController();
  final TextEditingController _url = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _reviewDescription =
      TextEditingController();
  final TextEditingController _newTag = TextEditingController();

  final DateFormat _formatter =
      DateFormat('yyyy-MM-ddTHH:mm:ss');
  final DateFormat _dateFormat =
      DateFormat('yyyy-MM-dd HH:mm:ss');

  DateTime? _expireTime;
  List<String> _tags = <String>[];
  ImageUploadState _uploadState = ImageUploadState.noFile;

  String get _buttonText {
    switch (widget.mode) {
      case Mode.add:
        return context.ap.submit;
      case Mode.edit:
        return context.ap.update;
      case Mode.editApplication:
      case Mode.application:
        return context.ap.submit;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.edit ||
        widget.mode == Mode.editApplication) {
      _announcement = widget.announcement!;
      _mapData();
    } else {
      _announcement = Announcement.empty();
    }
  }

  /// Updates the form with new announcement data (e.g. after fetch).
  void updateAnnouncement(Announcement data) {
    _announcement = data;
    _mapData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return KeyboardDismissOnTap(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: ApAppShell.contentPadding(
            context,
            spacing: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          ),
          children: <Widget>[
            if (widget.mode == Mode.application) ...<Widget>[
              const SizedBox(height: 16),
              _buildApplicationHint(colorScheme),
            ],
            const SizedBox(height: 16),
            _buildTextField(
              controller: _title,
              label: context.ap.title,
              validator: _requiredValidator,
            ),
            const SizedBox(height: 16),
            if (widget.mode !=
                Mode.application) ...<Widget>[
              Text(
                context.ap.tag,
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              _buildTagSection(colorScheme),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _weight,
                label: context.ap.weight,
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return context.ap.doNotEmpty;
                  }
                  try {
                    int.parse(value);
                  } catch (e) {
                    return context.ap.formatError;
                  }
                  return null;
                },
              ),
            ],
            const SizedBox(height: 16),
            _buildTextField(
              controller: _imgUrl,
              label: context.ap.imageUrl,
              enabled: false,
              validator: _requiredValidator,
            ),
            const SizedBox(height: 8),
            _buildImageUploadSection(colorScheme),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _url,
              label: context.ap.url,
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16),
            Divider(
              color: colorScheme.outlineVariant.withAlpha(77),
            ),
            const SizedBox(height: 8),
            _buildExpireTimeSection(colorScheme),
            const SizedBox(height: 8),
            Divider(
              color: colorScheme.outlineVariant.withAlpha(77),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _description,
              label: context.ap.description,
              maxLines: 5,
            ),
            if (widget.mode ==
                Mode.editApplication) ...<Widget>[
              const SizedBox(height: 16),
              _buildApplicantField(colorScheme),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _reviewDescription,
                label: context.ap.reviewDescription,
                maxLines: 2,
              ),
            ],
            const SizedBox(height: 32),
            _buildActionButtons(colorScheme),
          ],
        ),
      ),
    );
  }

  // ─── Form Fields ───────────────────────────────────────

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool enabled = true,
    int? maxLines,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      maxLines: maxLines,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _buildApplicationHint(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withAlpha(128),
        borderRadius: BorderRadius.circular(12),
      ),
      child: widget.applicationDescriptionWidget ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.info_outline,
                    size: 18,
                    color: colorScheme.onTertiaryContainer,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      context.ap.newsRuleDescription2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                context.ap.newsRuleDescription1(
                  arg1: widget.organizationDomain ?? '',
                ),
                style: TextStyle(
                  fontSize: 13,
                  color: colorScheme.onTertiaryContainer,
                ),
              ),
              Text(
                context.ap.newsRuleDescription3,
                style: TextStyle(
                  fontSize: 13,
                  color: colorScheme.onTertiaryContainer,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildApplicantField(ColorScheme colorScheme) {
    final String applicant = _announcement.applicant ?? '';
    final bool isBanned =
        widget.blackList.contains(applicant);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isBanned
            ? colorScheme.errorContainer.withAlpha(64)
            : colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isBanned
              ? colorScheme.error.withAlpha(77)
              : colorScheme.outlineVariant.withAlpha(77),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isBanned
                  ? colorScheme.errorContainer.withAlpha(128)
                  : colorScheme.secondaryContainer
                      .withAlpha(128),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              isBanned
                  ? Icons.person_off_outlined
                  : Icons.person_outline,
              size: 20,
              color: isBanned
                  ? colorScheme.error
                  : colorScheme.onSecondaryContainer,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  context.ap.applicant,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  applicant,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          if (isBanned)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                context.ap.blackList,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.error,
                ),
              ),
            ),
          IconButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(text: applicant),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(applicant),
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
            tooltip: applicant,
          ),
        ],
      ),
    );
  }

  // ─── Tags ──────────────────────────────────────────────

  Widget _buildTagSection(ColorScheme colorScheme) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        for (final String tag in _tags)
          Chip(
            label: Text(
              tag,
              style: TextStyle(
                color: tagColor(tag, colorScheme),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            backgroundColor:
                tagColor(tag, colorScheme).withAlpha(26),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            deleteIconColor: tagColor(tag, colorScheme),
            onDeleted: () =>
                setState(() => _tags.remove(tag)),
          ),
        ActionChip(
          label: Icon(
            Icons.add,
            size: 18,
            color: colorScheme.primary,
          ),
          backgroundColor:
              colorScheme.primaryContainer.withAlpha(128),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: _showAddTagDialog,
        ),
      ],
    );
  }

  void _showAddTagDialog() {
    _newTag.clear();
    showDialog(
      context: context,
      builder: (BuildContext ctx) => DefaultDialog(
        title: ctx.ap.addTag,
        contentWidget: TextField(
          controller: _newTag,
          decoration: InputDecoration(
            hintText: ctx.ap.tagName,
          ),
        ),
        actionText: ctx.ap.confirm,
        actionFunction: () {
          if (_newTag.text.isEmpty) {
            UiUtil.instance
                .showToast(ctx, ctx.ap.doNotEmpty);
          } else {
            final String newTag = _newTag.text;
            if (!_tags.contains(newTag)) {
              setState(() => _tags.add(newTag));
              Navigator.of(ctx, rootNavigator: true).pop();
            } else {
              UiUtil.instance
                  .showToast(ctx, ctx.ap.tagRepeatHint);
            }
          }
        },
      ),
    );
  }

  // ─── Image Upload ──────────────────────────────────────

  Widget _buildImageUploadSection(ColorScheme colorScheme) {
    return Column(
      children: <Widget>[
        switch (_uploadState) {
          ImageUploadState.uploading => Column(
              children: <Widget>[
                const CircularProgressIndicator(),
                const SizedBox(height: 8),
                Text(
                  context.ap.uploading,
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ImageUploadState.done => Column(
              children: <Widget>[
                Text(
                  context.ap.imagePreview,
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 300,
                    child: ApNetworkImage(
                      url: _imgUrl.text,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ImageUploadState.noFile => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                context.ap.imgurUploadDescription,
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 13,
                ),
              ),
            ),
        },
        FilledButton.tonal(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: _pickAndUploadImage,
          child: Text(context.ap.pickAndUploadToImgur),
        ),
      ],
    );
  }

  Future<void> _pickAndUploadImage() async {
    final XFile? image = await MediaUtil.instance.pickImage();
    if (image == null) return;

    setState(
      () => _uploadState = ImageUploadState.uploading,
    );

    final String? url = await widget.onImageUpload?.call(image);

    if (!mounted) return;
    if (url != null) {
      _imgUrl.text = url;
      setState(() => _uploadState = ImageUploadState.done);
    } else {
      setState(
        () => _uploadState = _imgUrl.text.isEmpty
            ? ImageUploadState.noFile
            : ImageUploadState.done,
      );
    }
  }

  // ─── Expire Time ───────────────────────────────────────

  Widget _buildExpireTimeSection(ColorScheme colorScheme) {
    return Column(
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: colorScheme.outline),
          ),
          onPressed: () =>
              setState(() => _expireTime = null),
          child: Text(context.ap.setNoExpireTime),
        ),
        const SizedBox(height: 8),
        ListTile(
          onTap: _pickStartDateTime,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
          leading: Icon(
            ApIcon.accessTime,
            size: 24,
            color: colorScheme.onSurfaceVariant,
          ),
          trailing: Icon(
            ApIcon.keyboardArrowDown,
            size: 24,
            color: colorScheme.onSurfaceVariant,
          ),
          title: Text(
            context.ap.expireTime,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            _expireTime == null
                ? context.ap.newsExpireTimeHint
                : _dateFormat.format(_expireTime!),
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickStartDateTime() async {
    final DateTime dateTime = _expireTime ??
        DateTime.now().add(const Duration(days: 7));
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1950),
      lastDate: DateTime(2099),
    );
    TimeOfDay? timeOfDay =
        TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
    //ignore: use_build_context_synchronously
    if (!mounted) return;
    timeOfDay = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );
    if (picked != null && timeOfDay != null) {
      setState(
        () => _expireTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          timeOfDay!.hour,
          timeOfDay.minute,
        ),
      );
    }
  }

  // ─── Action Buttons ────────────────────────────────────

  Widget _buildActionButtons(ColorScheme colorScheme) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => _submit(),
            child: Text(
              _buttonText,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        if (widget.mode ==
            Mode.editApplication) ...<Widget>[
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () =>
                  _submit(isApproval: true),
              child: Text(
                context.ap.updateAndApprove,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.error,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(color: colorScheme.error),
              ),
              onPressed: () =>
                  _submit(isApproval: false),
              child: Text(
                context.ap.updateAndReject,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.error,
                foregroundColor: colorScheme.onError,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => _submit(
                isApproval: false,
                addBlackList: true,
              ),
              child: Text(
                context.ap.updateRejectAndBan,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ],
    );
  }

  // ─── Data Mapping ──────────────────────────────────────

  void _mapData() {
    _title.text = _announcement.title;
    _imgUrl.text = _announcement.imgUrl;
    if (_announcement.imgUrl.isNotEmpty) {
      _uploadState = ImageUploadState.done;
    }
    if (_announcement.expireTime != null) {
      _expireTime =
          _formatter.parse(_announcement.expireTime!);
    }
    _url.text = _announcement.url ?? '';
    _weight.text = _announcement.weight.toString();
    _description.text = _announcement.description;
    _tags = _announcement.tags ?? <String>[];
  }

  Announcement _buildAnnouncement() {
    return _announcement.copyWith(
      title: _title.text,
      description: _description.text,
      imgUrl: _imgUrl.text,
      url: _url.text,
      weight: _weight.text.isNotEmpty
          ? (int.tryParse(_weight.text) ?? 0)
          : 0,
      expireTime: (_expireTime == null)
          ? null
          : _expireTime!.parseToString(),
      reviewDescription: _reviewDescription.text,
      tags: _tags,
    );
  }

  Future<void> _submit({
    bool? isApproval,
    bool? addBlackList,
  }) async {
    if (_formKey.currentState!.validate()) {
      await widget.onSubmit(
        _buildAnnouncement(),
        isApproval: isApproval,
        addBlackList: addBlackList,
      );
    }
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return context.ap.doNotEmpty;
    }
    return null;
  }
}
