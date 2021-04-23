import 'package:devquiz/shared/models/models.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final QuizModel quiz;
  final int rightAnswers;

  const ResultPage({required this.quiz, required this.rightAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding:
              const EdgeInsets.only(left: 68, right: 68, top: 68, bottom: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.trophy),
              Column(
                children: [
                  Text("Parabéns!", style: AppTextStyles.heading40),
                  SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Você concluiu\n",
                          style: AppTextStyles.body,
                        ),
                        TextSpan(
                          text: quiz.title,
                          style: AppTextStyles.bodyBold,
                        ),
                        TextSpan(
                          text:
                              "\ncom $rightAnswers de ${quiz.questions.length} acertos.",
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: NextButtonWidget.purple(
                      label: "Compartilhar",
                      onTap: () {
                        Share.share("${quiz.title}: acertei $rightAnswers de ${quiz.questions.length} questões");
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.maxFinite,
                    child: NextButtonWidget.transparent(
                      label: "Voltar ao início",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
