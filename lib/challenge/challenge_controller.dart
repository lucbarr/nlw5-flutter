import 'package:flutter/material.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(0);
  final numberOfRightAnswersNotifier = ValueNotifier<int>(0);

  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int get numberOfRightAnswers => numberOfRightAnswersNotifier.value;
  set numberOfRightAnswers(int value) => numberOfRightAnswersNotifier.value = value;

}