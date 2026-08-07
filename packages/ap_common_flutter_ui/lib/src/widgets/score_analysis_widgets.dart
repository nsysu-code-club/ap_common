import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';

/// PR 值卡片
class ScorePRCard extends StatelessWidget {
  const ScorePRCard({
    super.key,
    required this.analysis,
  });

  final ScoreAnalysis analysis;

  Color _getPRColor(ColorScheme colorScheme, int pr) {
    if (pr >= 90) return const Color(0xFF4CAF50);
    if (pr >= 75) return const Color(0xFF8BC34A);
    if (pr >= 50) return colorScheme.primary;
    if (pr >= 25) return const Color(0xFFFF9800);
    return colorScheme.error;
  }

  String _getLocalizedPRLevel(BuildContext context, int pr) {
    if (pr >= 90) return context.ap.prLevelTop;
    if (pr >= 75) return context.ap.prLevelExcellent;
    if (pr >= 50) return context.ap.prLevelAverage;
    if (pr >= 25) return context.ap.prLevelBelowAverage;
    return context.ap.prLevelNeedEffort;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final int pr = analysis.estimatedPR;
    final Color prColor = _getPRColor(colorScheme, pr);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant.withAlpha(77)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: prColor.withAlpha(26),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.trending_up_rounded,
                    size: 28,
                    color: prColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        context.ap.estimatedPR,
                        style: TextStyle(
                          fontSize: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'PR $pr',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: prColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: prColor.withAlpha(26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getLocalizedPRLevel(context, pr),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: prColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            height: 8,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: pr / 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[prColor.withAlpha(179), prColor],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              context.ap.prDisclaimer,
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant.withAlpha(179),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 成績統計卡片
class ScoreStatisticsCard extends StatelessWidget {
  const ScoreStatisticsCard({
    super.key,
    required this.analysis,
  });

  final ScoreAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant.withAlpha(77)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.bar_chart_rounded,
                  size: 20,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  context.ap.scoreStatistics,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: colorScheme.outlineVariant.withAlpha(77)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _ScoreStatItem(
                        label: context.ap.highestScore,
                        value: analysis.isGradePoint
                            ? ScoreAnalysis.gradePointToGradeLetter(
                                analysis.maxScore,
                              )
                            : analysis.maxScore.toStringAsFixed(0),
                        icon: Icons.arrow_upward_rounded,
                        color: const Color(0xFF4CAF50),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ScoreStatItem(
                        label: context.ap.lowestScore,
                        value: analysis.isGradePoint
                            ? ScoreAnalysis.gradePointToGradeLetter(
                                analysis.minScore,
                              )
                            : analysis.minScore.toStringAsFixed(0),
                        icon: Icons.arrow_downward_rounded,
                        color: colorScheme.error,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _ScoreStatItem(
                        label: context.ap.standardDeviation,
                        value: analysis.standardDeviation.toStringAsFixed(2),
                        icon: Icons.analytics_outlined,
                        color: colorScheme.tertiary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ScoreStatItem(
                        label: context.ap.subjectCount,
                        value: analysis.totalSubjects.toString(),
                        icon: Icons.menu_book_rounded,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreStatItem extends StatelessWidget {
  const _ScoreStatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withAlpha(13),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withAlpha(26),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 成績分佈卡片
class ScoreDistributionCard extends StatelessWidget {
  const ScoreDistributionCard({
    super.key,
    required this.analysis,
  });

  final ScoreAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant.withAlpha(77)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.pie_chart_rounded,
                  size: 20,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  context.ap.scoreDistribution,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: colorScheme.outlineVariant.withAlpha(77)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: analysis.isGradePoint
                ? _buildGradePointDistribution(colorScheme)
                : _buildNumericDistribution(context, colorScheme),
          ),
        ],
      ),
    );
  }

  Widget _buildNumericDistribution(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: <Widget>[
        _DistributionBar(
          label: context.ap.distributionExcellent,
          count: analysis.distribution['90-100'] ?? 0,
          total: analysis.totalSubjects,
          color: const Color(0xFF4CAF50),
        ),
        const SizedBox(height: 10),
        _DistributionBar(
          label: context.ap.distributionGood,
          count: analysis.distribution['80-89'] ?? 0,
          total: analysis.totalSubjects,
          color: const Color(0xFF8BC34A),
        ),
        const SizedBox(height: 10),
        _DistributionBar(
          label: context.ap.distributionAverage,
          count: analysis.distribution['70-79'] ?? 0,
          total: analysis.totalSubjects,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 10),
        _DistributionBar(
          label: context.ap.distributionPass,
          count: analysis.distribution['60-69'] ?? 0,
          total: analysis.totalSubjects,
          color: const Color(0xFFFF9800),
        ),
        const SizedBox(height: 10),
        _DistributionBar(
          label: context.ap.distributionFail,
          count: analysis.distribution['0-59'] ?? 0,
          total: analysis.totalSubjects,
          color: colorScheme.error,
        ),
      ],
    );
  }

  Widget _buildGradePointDistribution(ColorScheme colorScheme) {
    final Map<String, int> dist = analysis.distribution;
    final List<String> orderedGrades = <String>[
      'A+',
      'A',
      'A-',
      'B+',
      'B',
      'B-',
      'C+',
      'C',
      'C-',
      'D',
      'E',
      'F',
    ];
    final List<Widget> bars = <Widget>[];
    for (final String grade in orderedGrades) {
      final int count = dist[grade] ?? 0;
      if (count == 0) continue;
      if (bars.isNotEmpty) {
        bars.add(const SizedBox(height: 10));
      }
      bars.add(
        _DistributionBar(
          label: grade,
          count: count,
          total: analysis.totalSubjects,
          color: ScoreColors.forGrade(grade, colorScheme.primary),
        ),
      );
    }
    return Column(children: bars);
  }
}

class _DistributionBar extends StatelessWidget {
  const _DistributionBar({
    required this.label,
    required this.count,
    required this.total,
    required this.color,
  });

  final String label;
  final int count;
  final int total;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double percentage = total > 0 ? count / total : 0;

    return Row(
      children: <Widget>[
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
          ),
        ),
        Expanded(
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 40,
          child: Text(
            context.ap.subjectCountUnit(arg1: count),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

/// 學分統計卡片
class ScoreCreditSummaryCard extends StatelessWidget {
  const ScoreCreditSummaryCard({
    super.key,
    required this.analysis,
  });

  final ScoreAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant.withAlpha(77)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.account_balance_rounded,
                  size: 20,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  context.ap.creditStatistics,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: colorScheme.outlineVariant.withAlpha(77)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _CreditItem(
                    label: context.ap.creditsTaken,
                    value: analysis.totalCredits.toStringAsFixed(1),
                    color: colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: _CreditItem(
                    label: context.ap.creditsPassed,
                    value: analysis.passedCredits.toStringAsFixed(1),
                    color: const Color(0xFF4CAF50),
                  ),
                ),
                Expanded(
                  child: _CreditItem(
                    label: context.ap.creditsFailed,
                    value: analysis.failedCredits.toStringAsFixed(1),
                    color: colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CreditItem extends StatelessWidget {
  const _CreditItem({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: <Widget>[
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}

/// GPA 卡片（4.3 等第積分制）
class ScoreGPACard extends StatelessWidget {
  const ScoreGPACard({
    super.key,
    required this.analysis,
  });

  final ScoreAnalysis analysis;

  Color _getGPAColor(ColorScheme colorScheme, double gpa) {
    if (gpa >= 3.7) return const Color(0xFF4CAF50);
    if (gpa >= 3.0) return const Color(0xFF8BC34A);
    if (gpa >= 2.3) return colorScheme.primary;
    if (gpa >= 1.7) return const Color(0xFFFF9800);
    return colorScheme.error;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double gpa = analysis.gpa;
    final Color gpaColor = _getGPAColor(colorScheme, gpa);
    final String gradeLetter = analysis.isGradePoint
        ? ScoreAnalysis.gradePointToGradeLetter(gpa)
        : ScoreAnalysis.scoreToGradeLetter(analysis.average);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outlineVariant.withAlpha(77),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: gpaColor.withAlpha(26),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.grade_rounded,
                    size: 28,
                    color: gpaColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        context.ap.gpaTitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        gpa.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: gpaColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: gpaColor.withAlpha(26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    gradeLetter,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: gpaColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            height: 8,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: (gpa / 4.3).clamp(0.0, 1.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      gpaColor.withAlpha(179),
                      gpaColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          _buildGradeTable(context, colorScheme),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Text(
              context.ap.gpaDisclaimer,
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant.withAlpha(179),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradeTable(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    final List<_GradeEntry> entries = <_GradeEntry>[];
    final bool isGradePoint = analysis.isGradePoint;
    for (final Score score in analysis.scoreData.scores) {
      final String? raw = ScoreAnalysis.effectiveScoreStr(score);
      final double? value = isGradePoint
          ? ScoreAnalysis.parseGradePoint(raw)
          : ScoreAnalysis.parseScore(raw);
      final bool isInvalid = value == null;
      entries.add(
        _GradeEntry(
          title: score.title,
          score: value ?? 0,
          grade: isInvalid
              ? '-'
              : (isGradePoint
                  ? ScoreAnalysis.gradePointToGradeLetter(value)
                  : ScoreAnalysis.scoreToGradeLetter(value)),
          gradePoint: isInvalid
              ? 0.0
              : isGradePoint
                  ? value
                  : ScoreAnalysis.scoreToGradePoint(value),
          credits: double.tryParse(score.units) ?? 0,
        ),
      );
    }

    if (entries.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          Divider(
            height: 1,
            color: colorScheme.outlineVariant.withAlpha(77),
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text(
                  context.ap.subject,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                child: Text(
                  context.ap.gradeLetter,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  context.ap.gradePoint,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...entries.map(
            (_GradeEntry e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text(
                      e.title,
                      style: TextStyle(
                        fontSize: 13,
                        color: colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Text(
                      e.grade,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getGPAColor(
                          colorScheme,
                          e.gradePoint,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(
                      e.grade != '-' ? e.gradePoint.toStringAsFixed(1) : '-',
                      style: TextStyle(
                        fontSize: 13,
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _GradeEntry {
  const _GradeEntry({
    required this.title,
    required this.score,
    required this.grade,
    required this.gradePoint,
    required this.credits,
  });

  final String title;
  final double score;
  final String grade;
  final double gradePoint;
  final double credits;
}
