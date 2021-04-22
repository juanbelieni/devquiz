import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;
  final VoidCallback onTap;

  const QuizCardWidget({required this.quiz, required this.onTap});

  String get textProgress =>
      "${quiz.questionsAnswered}/${quiz.questions.length}";
  double get percentageProgress =>
      quiz.questionsAnswered / quiz.questions.length;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.asset(quiz.image),
            ),
            Text(
              quiz.title,
              style: AppTextStyles.heading15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(textProgress, style: AppTextStyles.body11),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(value: percentageProgress),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
