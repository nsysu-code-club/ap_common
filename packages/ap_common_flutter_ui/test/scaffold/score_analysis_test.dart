import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ScoreColors', () {
    test('uses the configured numeric passing score', () {
      expect(ScoreColors.forNumeric(55, 50), ScoreColors.passing);
      expect(ScoreColors.forNumeric(49, 50), ScoreColors.failing);
      expect(ScoreColors.forNumeric(82, 85), ScoreColors.failing);
    });

    test('uses the configured passing grade point', () {
      expect(ScoreColors.forGradePoint(1.5, 1.0), ScoreColors.passing);
      expect(ScoreColors.forGradePoint(0.9, 1.0), ScoreColors.failing);
      expect(ScoreColors.forGradePoint(3.5, 3.7), ScoreColors.failing);
    });
  });

  group('ScoreAnalysis credits', () {
    test('uses earned credits only for passed credits', () {
      final ScoreAnalysis analysis = ScoreAnalysis(
        _scoreData(
          detail: const Detail(creditEarned: 3, creditTaken: 6),
        ),
      );

      expect(analysis.passedCredits, 3);
      expect(analysis.failedCredits, 2);
      expect(analysis.totalCredits, 6);
    });

    test('calculates total credits when detail creditTaken is unavailable', () {
      final ScoreAnalysis analysis = ScoreAnalysis(
        _scoreData(detail: const Detail(creditEarned: 3)),
      );

      expect(analysis.passedCredits, 3);
      expect(analysis.failedCredits, 2);
      expect(analysis.totalCredits, 5);
    });
  });
}

ScoreData _scoreData({required Detail detail}) {
  return ScoreData(
    detail: detail,
    scores: <Score>[
      _score(title: 'Passed', units: '3', semesterScore: '80'),
      _score(title: 'Failed', units: '2', semesterScore: '50'),
    ],
  );
}

Score _score({
  required String title,
  required String units,
  required String semesterScore,
}) {
  return Score(
    courseNumber: null,
    title: title,
    units: units,
    hours: null,
    required: null,
    at: null,
    middleScore: null,
    generalScore: null,
    finalScore: null,
    semesterScore: semesterScore,
    remark: null,
  );
}
