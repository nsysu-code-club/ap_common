import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

enum BarCodeMode { code39, qrCode }

class UserInfoScaffold extends StatefulWidget {
  const UserInfoScaffold({
    super.key,
    required this.userInfo,
    this.heroTag,
    this.actions,
    this.onRefresh,
    this.enableBarCode = false,
  });

  final UserInfo userInfo;
  final String? heroTag;
  final List<Widget>? actions;
  final Future<UserInfo?> Function()? onRefresh;
  final bool enableBarCode;

  @override
  UserInfoScaffoldState createState() => UserInfoScaffoldState();
}

class UserInfoScaffoldState extends State<UserInfoScaffold> {
  BarCodeMode codeMode = BarCodeMode.qrCode;

  bool _isRefreshing = false;

  String get iconName {
    switch (codeMode) {
      case BarCodeMode.code39:
        return ApImageIcons.qrcode;
      case BarCodeMode.qrCode:
        return ApImageIcons.barcode;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _handleRefresh();
          AnalyticsUtil.instance.logEvent('user_info_refresh');
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isDark
                          ? <Color>[
                              colorScheme.primaryContainer,
                              colorScheme.surface,
                            ]
                          : <Color>[
                              colorScheme.primary,
                              colorScheme.primaryContainer,
                            ],
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 40),
                        _buildAvatar(colorScheme, isDark),
                        const SizedBox(height: 12),
                        Text(
                          widget.userInfo.name ?? '',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? colorScheme.onSurface
                                : colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                ...widget.actions ?? <Widget>[],
                if (widget.enableBarCode)
                  IconButton(
                    icon: Image.asset(
                      iconName,
                      height: 24.0,
                      width: 24.0,
                    ),
                    onPressed: () {
                      setState(
                        () => codeMode = BarCodeMode.values[
                            (codeMode.index + 1) % BarCodeMode.values.length],
                      );
                      AnalyticsUtil.instance
                          .logEvent('user_info_barcode_switch');
                    },
                  ),
                IconButton(
                  icon: _isRefreshing
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: isDark
                                ? colorScheme.onSurface
                                : colorScheme.onPrimary,
                          ),
                        )
                      : const Icon(Icons.refresh_rounded),
                  onPressed: _isRefreshing ? null : _handleRefresh,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    _buildInfoCard(colorScheme),
                    if (widget.enableBarCode) ...<Widget>[
                      const SizedBox(height: 16),
                      _buildBarcodeCard(colorScheme),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(ColorScheme colorScheme, bool isDark) {
    final bool hasImage = widget.userInfo.pictureBytes != null &&
        widget.userInfo.pictureBytes!.isNotEmpty;
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark
              ? colorScheme.primary
              : colorScheme.onPrimary.withAlpha(128),
          width: 4,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colorScheme.shadow.withAlpha(51),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 48,
        backgroundColor: isDark
            ? colorScheme.primaryContainer
            : colorScheme.onPrimary.withAlpha(51),
        backgroundImage:
            hasImage ? MemoryImage(widget.userInfo.pictureBytes!) : null,
        child: hasImage
            ? null
            : Icon(
                Icons.person_rounded,
                size: 56,
                color: isDark ? colorScheme.primary : colorScheme.onPrimary,
              ),
      ),
    );
  }

  Widget _buildInfoCard(ColorScheme colorScheme) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withAlpha(77),
        ),
      ),
      child: Column(
        children: <Widget>[
          InfoRow(
            icon: Icons.badge_outlined,
            title: context.ap.studentId,
            value: widget.userInfo.id,
          ),
          _buildDivider(colorScheme),
          if (widget.userInfo.educationSystem != null) ...<Widget>[
            InfoRow(
              icon: Icons.school_outlined,
              title: context.ap.educationSystem,
              value: widget.userInfo.educationSystem!,
            ),
            _buildDivider(colorScheme),
          ],
          if (widget.userInfo.email != null) ...<Widget>[
            InfoRow(
              icon: Icons.email_outlined,
              title: context.ap.email,
              value: widget.userInfo.email!,
            ),
            _buildDivider(colorScheme),
          ],
          InfoRow(
            icon: Icons.domain_outlined,
            title: context.ap.department,
            value: widget.userInfo.department ?? '',
          ),
          _buildDivider(colorScheme),
          InfoRow(
            icon: Icons.class_outlined,
            title: context.ap.studentClass,
            value: widget.userInfo.className ?? '',
          ),
        ],
      ),
    );
  }

  Widget _buildBarcodeCard(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withAlpha(77),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.badge_outlined,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                context.ap.studentIdBarcode,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  widget.userInfo.id,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    letterSpacing: 4,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 12),
                BarcodeWidget(
                  barcode: codeMode == BarCodeMode.code39
                      ? Barcode.code39()
                      : Barcode.qrCode(),
                  data: widget.userInfo.id,
                  color: colorScheme.onSurface,
                  height: codeMode == BarCodeMode.code39 ? 80 : 160,
                  width: codeMode == BarCodeMode.code39 ? double.infinity : 160,
                ),
                const SizedBox(height: 12),
                Text(
                  context.ap.barcodeHint,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(ColorScheme colorScheme) {
    return Divider(
      height: 1,
      indent: 72,
      color: colorScheme.outlineVariant.withAlpha(77),
    );
  }

  Future<void> _handleRefresh() async {
    if (widget.onRefresh == null) return;
    setState(() => _isRefreshing = true);
    await widget.onRefresh!();
    if (mounted) setState(() => _isRefreshing = false);
  }
}
