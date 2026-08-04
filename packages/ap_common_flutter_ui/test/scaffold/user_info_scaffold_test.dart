import 'package:ap_common_core/injector.dart';
import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers.dart';

void main() {
  setUpAll(() {
    injector.registerSingleton<PreferenceUtil>(() => MockPreferenceUtil());
    injector.registerSingleton<UiUtil>(() => MockUiUtil());
    injector.registerSingleton<AnalyticsUtil>(() => const MockAnalyticsUtil());
  });

  Widget buildTestApp(Widget child) {
    return TranslationProvider(
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: child,
          );
        },
      ),
    );
  }

  const UserInfo testUser = UserInfo(
    id: 'A123456789',
    department: 'Department of Testing',
    name: 'Test User',
  );

  group('UserInfoScaffold', () {
    // Small enough that the barcode card starts below the fold.
    const Size smallSize = Size(400, 600);

    testWidgets('drag on content scrolls barcode card fully into view',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(smallSize);
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        buildTestApp(
          const UserInfoScaffold(
            userInfo: testUser,
            enableBarCode: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder barcode = find.byType(BarcodeWidget);
      expect(barcode, findsOneWidget);
      // Sanity check: the barcode starts below the visible area.
      expect(
        tester.getBottomLeft(barcode).dy,
        greaterThan(smallSize.height),
      );

      // Drag upward on the page content, as a user would.
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
      await tester.pumpAndSettle();
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
      await tester.pumpAndSettle();

      // The barcode must be fully visible inside the viewport.
      expect(
        tester.getBottomLeft(barcode).dy,
        lessThanOrEqualTo(smallSize.height),
      );
    });

    testWidgets('pull-to-refresh triggers onRefresh',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(smallSize);
      addTearDown(() => tester.binding.setSurfaceSize(null));

      bool refreshCalled = false;
      await tester.pumpWidget(
        buildTestApp(
          UserInfoScaffold(
            userInfo: testUser,
            enableBarCode: true,
            onRefresh: () async {
              refreshCalled = true;
              return testUser;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Fling downward from the top of the list to trigger the indicator.
      await tester.fling(
        find.byType(CustomScrollView),
        const Offset(0, 300),
        1000,
      );
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(refreshCalled, isTrue);
    });
  });
}
