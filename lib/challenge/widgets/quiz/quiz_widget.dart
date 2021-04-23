import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/models.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onAnswer;
  const QuizWidget({required this.question, required this.onAnswer});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? selectedAnswer;

  List<AnswerModel> get answers => widget.question.answers;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (int i = 0; i < answers.length; i++)
            AnswerWidget(
              answer: answers[i],
              isSelected: selectedAnswer == i,
              onTap: () {
                if (selectedAnswer == null) {
                  setState(() {
                    selectedAnswer = i;
                  });
                  Future.delayed(Duration(seconds: 1)).then((_) {
                    widget.onAnswer(answers[i].isRight);
                  });
                }
              },
            )
        ],
      ),
    );
  }
}
