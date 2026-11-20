import 'dart:io';

import 'package:ap_common_core/injector.dart';
import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers.dart';

const double _topPadding = 40;
const double _pinnedBarHeight = _topPadding + kMinInteractiveDimensionCupertino;

void main() {
  setUpAll(() {
    injector.registerSingleton<PreferenceUtil>(() => MockPreferenceUtil());
    injector.registerSingleton<UiUtil>(() => MockUiUtil());
    injector.registerSingleton<AnalyticsUtil>(() => const MockAnalyticsUtil());
  });

  final CourseData courseData = CourseData.fromRawJson(
    File('../../apps/example/assets/coursetable.json').readAsStringSync(),
  );

  Future<void> pumpCourseInShell(
    WidgetTester tester, {
    required TargetPlatform platform,
    required Size logicalSize,
    Widget? page,
  }) async {
    tester.view.devicePixelRatio = 3;
    tester.view.physicalSize = logicalSize * 3;
    tester.view.padding =
        const FakeViewPadding(top: _topPadding * 3, bottom: 24 * 3);
    tester.view.viewPadding =
        const FakeViewPadding(top: _topPadding * 3, bottom: 24 * 3);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      TranslationProvider(
        child: Builder(
          builder: (BuildContext context) => MaterialApp(
            theme: ThemeData(platform: platform),
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: ApAppShell(
              initialDestinationId: 'course',
              destinations: <ApDestination>[
                ApDestination(
                  id: 'home',
                  label: 'Home',
                  icon: Icons.home,
                  builder: (_) => const SizedBox(),
                ),
                ApDestination(
                  id: 'course',
                  label: 'Course',
                  icon: Icons.book,
                  builder: (_) =>
                      page ??
                      CourseScaffold(
                        state: CourseState.finish,
                        courseData: courseData,
                        enableNotifyControl: false,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> scrollToEnd(WidgetTester tester) async {
    for (int i = 0; i < 6; i++) {
      await tester.drag(find.byType(CourseScaffold), const Offset(0, -600));
      await tester.pumpAndSettle();
    }
  }

  ScrollableState tableScrollable(WidgetTester tester) =>
      tester.stateList<ScrollableState>(find.byType(Scrollable)).lastWhere(
            (ScrollableState s) => s.widget.axisDirection == AxisDirection.down,
          );

  double top(BuildContext context) =>
      (context.findRenderObject()! as RenderBox).localToGlobal(Offset.zero).dy;

  final ScoreData scoreData = ScoreData.fromRawJson(
    File('../../apps/example/assets/scores.json').readAsStringSync(),
  );

  for (final bool isCourse in <bool>[true, false]) {
    testWidgets(
        '${isCourse ? 'Course' : 'Score'} landscape panes scroll independently',
        (WidgetTester tester) async {
      await pumpCourseInShell(
        tester,
        platform: TargetPlatform.iOS,
        logicalSize: const Size(844, 430),
        page: isCourse
            ? null
            : ScoreScaffold(
                state: ScoreState.finish,
                scoreData: scoreData,
                onRefresh: () async {},
              ),
      );

      ScrollableState pane({required bool left}) => tester
              .stateList<ScrollableState>(find.byType(Scrollable))
              .singleWhere(
            (ScrollableState state) {
              final RenderBox box =
                  state.context.findRenderObject()! as RenderBox;
              return state.widget.axisDirection == AxisDirection.down &&
                  box.size.width < 800 &&
                  (box.localToGlobal(Offset.zero).dx < 200) == left;
            },
          );

      final ScrollableState left = pane(left: true);
      final ScrollableState right = pane(left: false);
      final double leftOffset = left.position.pixels;
      final double leftTop = top(left.context);
      final RenderBox rightBox = right.context.findRenderObject()! as RenderBox;
      await tester.dragFrom(
        rightBox.localToGlobal(rightBox.size.center(Offset.zero)),
        const Offset(0, -180),
      );
      await tester.pumpAndSettle();

      expect(right.position.pixels, greaterThan(0));
      expect(left.position.pixels, leftOffset);
      expect(top(left.context), leftTop);
    });
  }

  for (final TargetPlatform platform in <TargetPlatform>[
    TargetPlatform.android,
    TargetPlatform.iOS,
  ]) {
    group('CourseScaffold in ApAppShell (${platform.name})', () {
      testWidgets('table is not hidden under the pinned bar when collapsed',
          (WidgetTester tester) async {
        await pumpCourseInShell(
          tester,
          platform: platform,
          logicalSize: const Size(448, 997),
        );
        final ScrollableState table = tableScrollable(tester);
        // Expanded: body sits below the full large-title header.
        expect(top(table.context), greaterThan(_pinnedBarHeight));

        await scrollToEnd(tester);
        // Collapsed: body starts exactly at the pinned bar's bottom edge.
        expect(top(table.context), moreOrLessEquals(_pinnedBarHeight));
      });

      testWidgets('table scrolls to the top edge of the bottom bar',
          (WidgetTester tester) async {
        // A screen short enough that the table must scroll.
        await pumpCourseInShell(
          tester,
          platform: platform,
          logicalSize: const Size(393, 700),
        );
        await scrollToEnd(tester);
        final ScrollableState table = tableScrollable(tester);
        final ScrollPosition position = table.position;
        expect(position.pixels, moreOrLessEquals(position.maxScrollExtent));
        expect(position.maxScrollExtent, greaterThan(0));
        // The viewport reaches the screen bottom so content scrolls behind
        // the translucent bottom bar.
        final double viewportBottom =
            top(table.context) + position.viewportDimension;
        expect(viewportBottom, moreOrLessEquals(700));
      });
    });
  }
}
