import 'package:flutter/material.dart';

class ApColors {
  ApColors._();

  static const Color blueDark = Color(0xff141e2f);
  static const Color onyx = Color(0xff121212);
  static const Color grayChateau = Color(0xffa5a5a5);

  static const Color blue200 = Color(0xffa7c7ff);
  static const Color blue300 = Color(0xff7cabff);
  static const Color blue400 = Color(0xff508fff);
  static const Color blue500 = Color(0xff2574ff);
  static const Color blue800 = Color(0xff0e2e66);

  static const Color grey100 = Color(0xffd7d7d7);
  static const Color grey150 = Color(0xffcacaca);
  static const Color grey200 = Color(0xffbdbdbd);
  static const Color grey500 = Color(0xff7c7c7c);
  static const Color grey800 = Color(0xff313131);
  static const Color charade = Color(0xff3c4043);
  static const Color solitude = Color(0xffe9eaed);

  static const Color yellow200 = Color(0xffffe399);
  static const Color yellow500 = Color(0xffffba00);
  static const Color yellow800 = Color(0xff664a00);

  static const Color red100 = Color(0xffffdade);
  static const Color red200 = Color(0xffffb6bd);
  static const Color red500 = Color(0xffff4a5a);
  static const Color red800 = Color(0xff661d24);

  //matrial design 3 color palette

  static const Color primary = Color(0xff2574ff);
  static const Color secondary = Color(0xff555f71);

  static const List<MaterialColor> colors = <MaterialColor>[
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.blueGrey,
  ];
}

/// Shared semantic colors for numeric scores and grade points.
abstract final class ScoreColors {
  static const Color excellent = Color(0xFF4CAF50);
  static const Color good = Color(0xFF8BC34A);
  static const Color average = Color(0xFF2196F3);
  static const Color passing = Color(0xFFFF9800);
  static const Color failing = Color(0xFFF44336);

  static Color forNumeric(double score, double passingScore) {
    if (score < passingScore) return failing;
    if (score >= 90) return excellent;
    if (score >= 80) return good;
    if (score >= 70) return average;
    return passing;
  }

  static Color forGradePoint(double gradePoint, double passingGradePoint) {
    if (gradePoint < passingGradePoint) return failing;
    if (gradePoint >= 4.0) return excellent;
    if (gradePoint >= 3.3) return good;
    if (gradePoint >= 2.7) return average;
    return passing;
  }

  static Color forGrade(String grade, Color fallback) {
    return switch (grade) {
      'A+' || 'A' => excellent,
      'A-' || 'B+' => good,
      'B' || 'B-' => average,
      'C+' || 'C' || 'C-' => passing,
      'D' || 'E' || 'F' => failing,
      _ => fallback,
    };
  }
}
