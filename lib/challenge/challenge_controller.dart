import 'package:flutter/foundation.dart';

class ChallengeController {
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  int get currentPage => currentPageNotifier.value;
  set currentPage(int currentPage) => currentPageNotifier.value = currentPage;

  int rightAnswers = 0;
}
