import 'dart:math';

import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

enum ScoreState { loading, finish, error, empty, offlineEmpty, custom }

class ScoreScaffold extends StatefulWidget {
  const ScoreScaffold({
    super.key,
    required this.state,
    required this.scoreData,
    required this.onRefresh,
    this.title,
    this.itemPicker,
    this.semesterData,
    this.onSelect,
    this.onSearchButtonClick,
    this.middleTitle,
    this.finalTitle,
    this.onScoreSelect,
    this.middleScoreBuilder,
    this.finalScoreBuilder,
    this.customHint,
    this.isShowSearchButton = false,
    this.showPRCard,
    this.bottom,
    this.customStateHint,
    this.semesterPickerController,
    this.semesterPickerUiConfig,
  });

  /// Creates a [ScoreScaffold] from a [DataState<ScoreData>].
  ///
  /// ```dart
  /// ScoreScaffold.fromDataState(
  ///   dataState: DataLoaded(scoreData),
  ///   onRefresh: () async => loadScore(),
  /// )
  /// ```
  ScoreScaffold.fromDataState({
    super.key,
    required DataState<ScoreData?> dataState,
    required this.onRefresh,
    this.title,
    this.itemPicker,
    this.semesterData,
    this.onSelect,
    this.onSearchButtonClick,
    this.middleTitle,
    this.finalTitle,
    this.onScoreSelect,
    this.middleScoreBuilder,
    this.finalScoreBuilder,
    this.isShowSearchButton = false,
    this.showPRCard = true,
    this.bottom,
    this.semesterPickerController,
    this.semesterPickerUiConfig,
  })  : state = dataState.when(
          loading: () => ScoreState.loading,
          loaded: (_, __) => ScoreState.finish,
          error: (_) => ScoreState.error,
          empty: (_) => ScoreState.empty,
        ),
        scoreData = dataState.dataOrNull,
        customHint =
            dataState is DataLoaded<ScoreData?> ? dataState.hint : null,
        customStateHint = dataState is DataError<ScoreData?>
            ? dataState.hint
            : dataState is DataEmpty<ScoreData?>
                ? dataState.hint
                : null;
  static const String routerName = '/score';

  final ScoreState state;
  final String? customStateHint;
  final String? title;
  final ScoreData? scoreData;
  final SemesterData? semesterData;
  final Function(int index)? onSelect;
  final Function()? onSearchButtonClick;
  final Function()? onRefresh;
  final Widget? itemPicker;
  final String? middleTitle;
  final String? finalTitle;
  final Function(int index)? onScoreSelect;
  final Widget Function(int index)? middleScoreBuilder;
  final Widget Function(int index)? finalScoreBuilder;

  final bool isShowSearchButton;
  final bool? showPRCard;

  final String? customHint;

  final Widget? bottom;

  /// Optional controller for the semester picker.
  final SemesterPickerController? semesterPickerController;

  /// Optional UI config for the semester picker.
  final SemesterUIConfig? semesterPickerUiConfig;

  @override
  ScoreScaffoldState createState() => ScoreScaffoldState();
}

class ScoreScaffoldState extends State<ScoreScaffold> {
  bool get isLandscape =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  bool _isAnalysisView = true;
  late ScrollController _scrollController;
  bool _showFab = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_showFab) {
          setState(() => _showFab = false);
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_showFab) {
          setState(() => _showFab = true);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          widget.title ?? context.ap.score,
          overflow: TextOverflow.ellipsis,
        ),
        bottom: widget.bottom as PreferredSizeWidget?,
        actions: <Widget>[
          if (widget.itemPicker != null) ...<Widget>[
            widget.itemPicker!,
            const SizedBox(width: 12),
          ],
          if (widget.semesterData != null &&
              widget.itemPicker == null) ...<Widget>[
            SemesterPicker(
              semesterData: widget.semesterData!,
              currentIndex: widget.semesterData!.currentIndex,
              onSelect: (Semester semester, int index) {
                widget.onSelect?.call(index);
              },
              featureTag: 'score',
              controller: widget.semesterPickerController,
              uiConfig: widget.semesterPickerUiConfig,
            ),
            const SizedBox(width: 12),
          ],
        ],
      ),
      floatingActionButton: AnimatedScale(
        scale: _showFab ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            if (widget.state == ScoreState.finish &&
                widget.scoreData != null &&
                widget.scoreData!.scores.isNotEmpty &&
                !isLandscape)
              FloatingActionButton(
                key: const ValueKey<String>('switch_view_button'),
                heroTag: 'switch_view_button',
                onPressed: () {
                  HapticFeedback.selectionClick();
                  setState(() => _isAnalysisView = !_isAnalysisView);
                },
                child: Icon(
                  _isAnalysisView
                      ? Icons.list_alt_rounded
                      : Icons.analytics_outlined,
                ),
              ),
            if (widget.isShowSearchButton) ...<Widget>[
              if (widget.state == ScoreState.finish &&
                  widget.scoreData != null &&
                  widget.scoreData!.scores.isNotEmpty &&
                  !isLandscape)
                const SizedBox(height: 8),
              FloatingActionButton(
                key: const ValueKey<String>('search_button'),
                heroTag: 'search_button',
                onPressed: () {
                  _pickSemester();
                  AnalyticsUtil.instance.logEvent('score_search_button_click');
                },
                child: const Icon(Icons.search),
              ),
            ],
          ],
        ),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                if (widget.customHint != null && widget.customHint!.isNotEmpty)
                  _buildHintBanner(),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _buildContent(context, colorScheme),
                  ),
                ),
              ],
            ),
          ),
          if (widget.state == ScoreState.finish && isLandscape) ...<Widget>[
            const SizedBox(width: 16.0),
            Expanded(
              flex: 2,
              child: Material(
                elevation: 12.0,
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: _ScoreListTab(
                    scoreData: widget.scoreData!,
                    onRefresh: widget.onRefresh,
                    middleTitle: widget.middleTitle,
                    finalTitle: widget.finalTitle,
                    onScoreSelect: widget.onScoreSelect,
                    middleScoreBuilder: widget.middleScoreBuilder,
                    finalScoreBuilder: widget.finalScoreBuilder,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHintBanner() {
    return HintBanner(text: widget.customHint!);
  }

  String get hintContent {
    switch (widget.state) {
      case ScoreState.error:
        return context.ap.clickToRetry;
      case ScoreState.empty:
        return context.ap.scoreEmpty;
      case ScoreState.offlineEmpty:
        return context.ap.noOfflineData;
      case ScoreState.custom:
        return widget.customStateHint ?? context.ap.unknownError;
      default:
        return '';
    }
  }

  Widget _buildContent(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    switch (widget.state) {
      case ScoreState.loading:
        return KeyedSubtree(
          key: const ValueKey<ScoreState>(ScoreState.loading),
          child: _buildLoadingState(colorScheme),
        );
      case ScoreState.error:
        return KeyedSubtree(
          key: const ValueKey<ScoreState>(ScoreState.error),
          child: _buildErrorState(
            colorScheme,
            context.ap.clickToRetry,
            Icons.error_outline_rounded,
          ),
        );
      case ScoreState.empty:
        return KeyedSubtree(
          key: const ValueKey<ScoreState>(ScoreState.empty),
          child: _buildErrorState(
            colorScheme,
            context.ap.scoreEmpty,
            Icons.assignment_outlined,
          ),
        );
      case ScoreState.offlineEmpty:
        return KeyedSubtree(
          key: const ValueKey<ScoreState>(ScoreState.offlineEmpty),
          child: _buildErrorState(
            colorScheme,
            context.ap.noOfflineData,
            Icons.cloud_off_rounded,
          ),
        );
      case ScoreState.custom:
        return KeyedSubtree(
          key: const ValueKey<ScoreState>(ScoreState.custom),
          child: _buildErrorState(
            colorScheme,
            widget.customStateHint ?? context.ap.somethingError,
            Icons.warning_amber_rounded,
          ),
        );
      case ScoreState.finish:
        return ScoreContent(
          scoreData: widget.scoreData,
          onRefresh: widget.onRefresh,
          middleTitle: widget.middleTitle,
          finalTitle: widget.finalTitle,
          onScoreSelect: widget.onScoreSelect,
          middleScoreBuilder: widget.middleScoreBuilder,
          finalScoreBuilder: widget.finalScoreBuilder,
          isAnalysisView: isLandscape || _isAnalysisView,
          scrollController: _scrollController,
          showPRCard: widget.showPRCard,
        );
    }
  }

  Widget _buildLoadingState(ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.ap.loading,
            style: TextStyle(fontSize: 16, color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    ColorScheme colorScheme,
    String message,
    IconData icon,
  ) {
    return InkWell(
      onTap: () {
        if (widget.state == ScoreState.empty) {
          _pickSemester();
        } else {
          widget.onRefresh?.call();
        }
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withAlpha(77),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, size: 40, color: colorScheme.primary),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (widget.state != ScoreState.empty) ...<Widget>[
              const SizedBox(height: 8),
              Text(
                context.ap.clickToRetry,
                style: TextStyle(fontSize: 14, color: colorScheme.primary),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _pickSemester() {
    if (widget.semesterData != null) {
      SemesterPicker.show(
        context: context,
        semesterData: widget.semesterData!,
        currentIndex: widget.semesterData!.currentIndex,
        onSelect: (Semester semester, int index) {
          widget.onSelect?.call(index);
        },
        controller: widget.semesterPickerController,
      );
    }
    widget.onSearchButtonClick?.call();
  }
}

class ScoreContent extends StatefulWidget {
  const ScoreContent({
    super.key,
    required this.scoreData,
    this.onRefresh,
    this.middleTitle,
    this.finalTitle,
    this.onScoreSelect,
    this.middleScoreBuilder,
    this.finalScoreBuilder,
    required this.isAnalysisView,
    this.scrollController,
    this.showPRCard,
  });

  final ScoreData? scoreData;
  final Function()? onRefresh;
  final String? middleTitle;
  final String? finalTitle;
  final Function(int index)? onScoreSelect;
  final Widget Function(int index)? middleScoreBuilder;
  final Widget Function(int index)? finalScoreBuilder;
  final bool isAnalysisView;
  final ScrollController? scrollController;
  final bool? showPRCard;

  @override
  _ScoreContentState createState() => _ScoreContentState();
}

class _ScoreContentState extends State<ScoreContent> {
  @override
  Widget build(BuildContext context) {
    if (widget.scoreData == null) return const SizedBox.shrink();

    if (widget.isAnalysisView) {
      return _ScoreAnalysisTab(
        scoreData: widget.scoreData!,
        onRefresh: widget.onRefresh,
        controller: widget.scrollController,
        showPRCard: widget.showPRCard,
      );
    } else {
      return _ScoreListTab(
        scoreData: widget.scoreData!,
        onRefresh: widget.onRefresh,
        middleTitle: widget.middleTitle,
        finalTitle: widget.finalTitle,
        onScoreSelect: widget.onScoreSelect,
        middleScoreBuilder: widget.middleScoreBuilder,
        finalScoreBuilder: widget.finalScoreBuilder,
        controller: widget.scrollController,
      );
    }
  }
}

class _ScoreListTab extends StatelessWidget {
  const _ScoreListTab({
    required this.scoreData,
    this.onRefresh,
    this.middleTitle,
    this.finalTitle,
    this.onScoreSelect,
    this.middleScoreBuilder,
    this.finalScoreBuilder,
    this.controller,
  });

  final ScoreData scoreData;
  final VoidCallback? onRefresh;
  final String? middleTitle;
  final String? finalTitle;
  final Function(int index)? onScoreSelect;
  final Widget Function(int index)? middleScoreBuilder;
  final Widget Function(int index)? finalScoreBuilder;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return RefreshIndicator(
      onRefresh: () async => onRefresh?.call(),
      child: ListView.builder(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: scoreData.scores.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildScoreItem(
            context,
            colorScheme,
            scoreData.scores[index],
            index,
          );
        },
      ),
    );
  }

  Widget _buildScoreItem(
    BuildContext context,
    ColorScheme colorScheme,
    Score score,
    int index,
  ) {
    final String? effectiveStr = _effectiveScoreStr(score);
    final double? scoreValue = _parseScore(
      effectiveStr,
      scoreData.scoreType,
    );
    final bool isPassed = scoreValue != null &&
        (scoreData.scoreType == ScoreType.gradePoint
            ? scoreValue >= scoreData.passingGradePoint
            : scoreValue >= scoreData.passingScore);
    final Color scoreColor = scoreValue == null
        ? colorScheme.onSurfaceVariant
        : isPassed
            ? scoreData.scoreType == ScoreType.gradePoint
                ? ScoreColors.forGradePoint(
                    scoreValue,
                    scoreData.passingGradePoint,
                  )
                : ScoreColors.forNumeric(
                    scoreValue,
                    scoreData.passingScore,
                  )
            : colorScheme.error;

    return GestureDetector(
      onTap: onScoreSelect == null
          ? null
          : () {
              onScoreSelect!(index);
              AnalyticsUtil.instance.logEvent('score_title_click');
            },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.outlineVariant.withAlpha(77)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Container(
                width: 4,
                height: 50,
                decoration: BoxDecoration(
                  color: scoreColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      score.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        _buildTag(
                          colorScheme,
                          score.required ?? '',
                          colorScheme.tertiary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          context.ap.unitCountFormat(
                            arg1: score.units,
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  if (finalScoreBuilder == null)
                    ..._buildScoreDisplay(
                      colorScheme,
                      score,
                      scoreValue,
                      scoreColor,
                    ),
                  if (finalScoreBuilder != null) finalScoreBuilder!(index),
                  const SizedBox(height: 4),
                  if (middleScoreBuilder == null &&
                      score.middleScore != null &&
                      score.middleScore!.isNotEmpty)
                    Text(
                      context.ap.midtermPrefix(
                        arg1: score.middleScore!,
                      ),
                      style: TextStyle(
                        fontSize: 11,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  if (middleScoreBuilder != null) middleScoreBuilder!(index),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build the score display based on data type.
  /// - Numeric scores (e.g. "90") → show number + converted letter grade
  /// - Grade points (e.g. "A+" or "4.3") → show the complementary format
  List<Widget> _buildScoreDisplay(
    ColorScheme colorScheme,
    Score score,
    double? scoreValue,
    Color scoreColor,
  ) {
    final String raw = _effectiveScoreStr(score) ?? '-';
    final bool isNumeric = scoreData.scoreType == ScoreType.numeric;

    if (scoreValue == null) {
      // Cannot parse at all — show raw string
      return <Widget>[
        Text(
          raw,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: scoreColor,
          ),
        ),
      ];
    }

    if (isNumeric) {
      // Data source is numeric → show number as primary,
      // letter grade as secondary
      return <Widget>[
        Text(
          raw,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: scoreColor,
          ),
        ),
        Text(
          ScoreAnalysis.scoreToGradeLetter(scoreValue),
          style: TextStyle(
            fontSize: 11,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ];
    } else {
      // Data source is a letter grade or grade point. Preserve the raw value
      // as primary and show its complementary representation as secondary.
      final bool rawIsGradePoint = double.tryParse(raw.trim()) != null;
      return <Widget>[
        Text(
          raw,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: scoreColor,
          ),
        ),
        Text(
          rawIsGradePoint
              ? ScoreAnalysis.gradePointToGradeLetter(scoreValue)
              : scoreValue.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 11,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ];
    }
  }

  /// Delegates to [ScoreAnalysis.effectiveScoreStr].
  static String? _effectiveScoreStr(Score score) =>
      ScoreAnalysis.effectiveScoreStr(score);

  /// Parses a score using the scale declared by [scoreType].
  static double? _parseScore(String? scoreStr, ScoreType scoreType) {
    return switch (scoreType) {
      ScoreType.numeric => ScoreAnalysis.parseScore(scoreStr),
      ScoreType.gradePoint => ScoreAnalysis.parseGradePoint(scoreStr),
    };
  }

  Widget _buildTag(ColorScheme colorScheme, String text, Color color) {
    if (text.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text.replaceAll('【', '').replaceAll('】', ''),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _ScoreAnalysisTab extends StatelessWidget {
  const _ScoreAnalysisTab({
    required this.scoreData,
    this.onRefresh,
    this.controller,
    this.showPRCard,
  });

  final ScoreData scoreData;
  final VoidCallback? onRefresh;
  final ScrollController? controller;
  final bool? showPRCard;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ScoreAnalysis analysis = ScoreAnalysis(scoreData);

    return RefreshIndicator(
      onRefresh: () async => onRefresh?.call(),
      child: SingleChildScrollView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _buildMainSummaryCard(colorScheme, context.ap, analysis),
            const SizedBox(height: 16),
            if (showPRCard != false) ...<Widget>[
              ScorePRCard(analysis: analysis),
              const SizedBox(height: 16),
            ],
            ScoreGPACard(analysis: analysis),
            const SizedBox(height: 16),
            ScoreStatisticsCard(analysis: analysis),
            const SizedBox(height: 16),
            ScoreDistributionCard(analysis: analysis),
            const SizedBox(height: 16),
            ScoreCreditSummaryCard(analysis: analysis),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildMainSummaryCard(
    ColorScheme colorScheme,
    ApLocalizations ap,
    ScoreAnalysis analysis,
  ) {
    final Detail detail = scoreData.detail;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            colorScheme.primaryContainer,
            colorScheme.secondaryContainer,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colorScheme.primary.withAlpha(38),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _buildMainItem(
                    colorScheme,
                    Icons.star_rounded,
                    ap.average,
                    detail.average?.toStringAsFixed(2) ?? '-',
                  ),
                ),
                if (detail.conduct != null) ...<Widget>[
                  Container(
                    width: 1,
                    height: 60,
                    color: colorScheme.onPrimaryContainer.withAlpha(51),
                  ),
                  Expanded(
                    child: _buildMainItem(
                      colorScheme,
                      Icons.school_rounded,
                      ap.conductScore,
                      detail.conduct!.toStringAsFixed(0),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (detail.classRank != null || detail.departmentRank != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: colorScheme.surface.withAlpha(179),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Row(
                children: <Widget>[
                  if (detail.classRank != null)
                    Expanded(
                      child: _buildRankItem(
                        colorScheme,
                        ap.classRank,
                        detail.classRank!,
                      ),
                    ),
                  if (detail.classRank != null && detail.departmentRank != null)
                    Container(
                      width: 1,
                      height: 40,
                      color: colorScheme.outlineVariant.withAlpha(128),
                    ),
                  if (detail.departmentRank != null)
                    Expanded(
                      child: _buildRankItem(
                        colorScheme,
                        ap.departmentRank,
                        detail.departmentRank!,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMainItem(
    ColorScheme colorScheme,
    IconData icon,
    String label,
    String value,
  ) {
    return Column(
      children: <Widget>[
        Icon(icon, size: 28, color: colorScheme.primary),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: colorScheme.onPrimaryContainer.withAlpha(179),
          ),
        ),
      ],
    );
  }

  Widget _buildRankItem(ColorScheme colorScheme, String label, String value) {
    return Column(
      children: <Widget>[
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}

class ScoreAnalysis {
  ScoreAnalysis(this.scoreData) {
    _scores = <double>[];
    _gradePoints = <double>[];
    for (final Score score in scoreData.scores) {
      final double? value = _scoreValue(score);
      if (value == null) continue;

      _scores.add(value);
      _gradePoints.add(isGradePoint ? value : scoreToGradePoint(value));
    }
    _totalSubjects = _scores.length;
  }

  final ScoreData scoreData;
  late List<double> _scores;
  late List<double> _gradePoints;
  late int _totalSubjects;

  bool get isGradePoint => scoreData.scoreType == ScoreType.gradePoint;

  /// Whether a score in the scale declared by [ScoreData.scoreType] is passing.
  bool isPassing(double scoreValue) {
    if (isGradePoint) {
      return scoreValue >= scoreData.passingGradePoint;
    }
    return scoreValue >= scoreData.passingScore;
  }

  int get totalSubjects => _totalSubjects;

  double get maxScore => _scores.isEmpty ? 0 : _scores.reduce(max);

  double get minScore => _scores.isEmpty ? 0 : _scores.reduce(min);

  double get average {
    final double? detailAverage = scoreData.detail.average;
    if (isGradePoint && detailAverage != null) return detailAverage;

    double totalWeighted = 0;
    double totalUnits = 0;
    for (final Score score in scoreData.scores) {
      final double? value = _scoreValue(score);
      final double? unit = double.tryParse(score.units);
      if (value != null && unit != null && unit > 0) {
        totalWeighted += value * unit;
        totalUnits += unit;
      }
    }
    if (totalUnits == 0) return 0;
    return totalWeighted / totalUnits;
  }

  double get standardDeviation {
    if (_scores.isEmpty) return 0;
    final List<double> values = isGradePoint ? _gradePoints : _scores;
    final double avg = average;
    final double sumSquares = values.fold<double>(
      0,
      (double sum, double v) => sum + (v - avg) * (v - avg),
    );
    return sqrt(sumSquares / values.length);
  }

  int get estimatedPR {
    final double avg = scoreData.detail.average ?? average;
    if (isGradePoint) {
      if (avg >= 4.0) return 95;
      if (avg >= 3.7) return 88;
      if (avg >= 3.3) return 78;
      if (avg >= 3.0) return 65;
      if (avg >= 2.7) return 50;
      if (avg >= 2.3) return 35;
      if (avg >= 1.7) return 22;
      return 5;
    }
    if (avg >= 95) return 99;
    if (avg >= 90) return 95;
    if (avg >= 85) return 88;
    if (avg >= 80) return 78;
    if (avg >= 75) return 65;
    if (avg >= 70) return 50;
    if (avg >= 65) return 35;
    if (avg >= 60) return 22;
    if (avg >= 55) return 12;
    return 5;
  }

  /// Use [ApLocalizations.prLevelTop] etc. for localized values.
  @Deprecated('Use context.ap.prLevelTop/Excellent/Average instead')
  String get prLevel {
    final int pr = estimatedPR;
    if (pr >= 90) return 'Top';
    if (pr >= 75) return 'Excellent';
    if (pr >= 50) return 'Average';
    if (pr >= 25) return 'Below Average';
    return 'Needs Improvement';
  }

  Map<String, int> get distribution {
    if (isGradePoint) return gradeDistribution;
    final Map<String, int> dist = <String, int>{
      '90-100': 0,
      '80-89': 0,
      '70-79': 0,
      '60-69': 0,
      '0-59': 0,
    };

    for (final double score in _scores) {
      if (score >= 90) {
        dist['90-100'] = dist['90-100']! + 1;
      } else if (score >= 80) {
        dist['80-89'] = dist['80-89']! + 1;
      } else if (score >= 70) {
        dist['70-79'] = dist['70-79']! + 1;
      } else if (score >= 60) {
        dist['60-69'] = dist['60-69']! + 1;
      } else {
        dist['0-59'] = dist['0-59']! + 1;
      }
    }

    return dist;
  }

  double get passedCredits {
    final double? detailCredits = scoreData.detail.creditEarned;
    if (detailCredits != null && detailCredits > 0) return detailCredits;
    double credits = 0;
    for (final Score score in scoreData.scores) {
      final double? scoreValue = _scoreValue(score);
      final double? unit = double.tryParse(score.units);
      if (scoreValue != null && isPassing(scoreValue) && unit != null) {
        credits += unit;
      }
    }
    return credits;
  }

  double get failedCredits {
    double credits = 0;
    for (final Score score in scoreData.scores) {
      final double? scoreValue = _scoreValue(score);
      final double? unit = double.tryParse(score.units);
      if (scoreValue != null && !isPassing(scoreValue) && unit != null) {
        credits += unit;
      }
    }
    return credits;
  }

  double get totalCredits {
    final double? detailCredits = scoreData.detail.creditTaken;
    if (detailCredits != null && detailCredits > 0) return detailCredits;
    return passedCredits + failedCredits;
  }

  /// Returns the effective score string for a [Score], preferring
  /// [Score.semesterScore] and falling back to [Score.finalScore].
  static String? effectiveScoreStr(Score score) {
    if (score.semesterScore != null && score.semesterScore!.isNotEmpty) {
      return score.semesterScore;
    }
    if (score.finalScore != null && score.finalScore!.isNotEmpty) {
      return score.finalScore;
    }
    return null;
  }

  /// Try to parse a score string as a number.
  /// If it's a letter grade, convert to approximate numeric.
  static double? parseScore(String? scoreStr) {
    if (scoreStr == null || scoreStr.isEmpty) return null;
    final double? numeric = double.tryParse(scoreStr);
    if (numeric != null) return numeric;
    switch (scoreStr.trim().toUpperCase()) {
      case 'A+':
        return 95;
      case 'A':
        return 87;
      case 'A-':
        return 82;
      case 'B+':
        return 78;
      case 'B':
        return 75;
      case 'B-':
        return 72;
      case 'C+':
        return 68;
      case 'C':
        return 65;
      case 'C-':
        return 62;
      case 'D':
        return 55;
      case 'E':
        return 45;
      case 'F':
        return 30;
      default:
        return null;
    }
  }

  /// Parses either a numeric grade point (for example, `4.3`) or a letter
  /// grade (for example, `A+`) into the NSYSU 4.3 GPA scale.
  static double? parseGradePoint(String? scoreStr) {
    if (scoreStr == null || scoreStr.trim().isEmpty) return null;
    final String normalized = scoreStr.trim().toUpperCase();
    final double? numeric = double.tryParse(normalized);
    if (numeric != null) {
      return numeric >= 0 && numeric <= 4.3 ? numeric : null;
    }
    return switch (normalized) {
      'A+' => 4.3,
      'A' => 4.0,
      'A-' => 3.7,
      'B+' => 3.3,
      'B' => 3.0,
      'B-' => 2.7,
      'C+' => 2.3,
      'C' => 2.0,
      'C-' => 1.7,
      'D' => 1.0,
      'E' => 0.8,
      'F' => 0.0,
      _ => null,
    };
  }

  /// Converts a numeric score (百分制) to a grade point (等第積分)
  /// based on the NSYSU 4.3 GPA scale.
  static double scoreToGradePoint(double score) {
    if (score >= 90) return 4.3;
    if (score >= 85) return 4.0;
    if (score >= 80) return 3.7;
    if (score >= 77) return 3.3;
    if (score >= 73) return 3.0;
    if (score >= 70) return 2.7;
    if (score >= 67) return 2.3;
    if (score >= 63) return 2.0;
    if (score >= 60) return 1.7;
    if (score >= 50) return 1.0;
    if (score >= 40) return 0.8;
    return 0;
  }

  /// Converts a numeric score (百分制) to a letter grade (等第成績).
  static String scoreToGradeLetter(double score) {
    if (score >= 90) return 'A+';
    if (score >= 85) return 'A';
    if (score >= 80) return 'A-';
    if (score >= 77) return 'B+';
    if (score >= 73) return 'B';
    if (score >= 70) return 'B-';
    if (score >= 67) return 'C+';
    if (score >= 63) return 'C';
    if (score >= 60) return 'C-';
    if (score >= 50) return 'D';
    if (score >= 40) return 'E';
    return 'F';
  }

  /// Converts a grade point (等第積分) to a letter grade (等第成績).
  static String gradePointToGradeLetter(double gpa) {
    if (gpa >= 4.3) return 'A+';
    if (gpa >= 4.0) return 'A';
    if (gpa >= 3.7) return 'A-';
    if (gpa >= 3.3) return 'B+';
    if (gpa >= 3.0) return 'B';
    if (gpa >= 2.7) return 'B-';
    if (gpa >= 2.3) return 'C+';
    if (gpa >= 2.0) return 'C';
    if (gpa >= 1.7) return 'C-';
    if (gpa >= 1.0) return 'D';
    if (gpa >= 0.8) return 'E';
    return 'F';
  }

  /// Weighted GPA: Σ(grade_point × credits) / Σ(credits)
  double get gpa {
    final double? detailAverage = scoreData.detail.average;
    if (isGradePoint && detailAverage != null) return detailAverage;

    double totalWeighted = 0;
    double totalUnits = 0;
    for (final Score score in scoreData.scores) {
      final double? scoreValue = _scoreValue(score);
      final double? unit = double.tryParse(score.units);
      if (scoreValue != null && unit != null && unit > 0) {
        final double gradePoint =
            isGradePoint ? scoreValue : scoreToGradePoint(scoreValue);
        totalWeighted += gradePoint * unit;
        totalUnits += unit;
      }
    }
    if (totalUnits == 0) return 0;
    return totalWeighted / totalUnits;
  }

  /// Grade distribution by letter grade (等第分佈).
  Map<String, int> get gradeDistribution {
    final Map<String, int> dist = <String, int>{};
    for (final double gradePoint in _gradePoints) {
      final String grade = gradePointToGradeLetter(gradePoint);
      dist[grade] = (dist[grade] ?? 0) + 1;
    }
    return dist;
  }

  double? _scoreValue(Score score) {
    final String? raw = effectiveScoreStr(score);
    return isGradePoint ? parseGradePoint(raw) : parseScore(raw);
  }
}
