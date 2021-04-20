import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AwnserWidget(
            title:
                "Teste de resposta do quiz quiz quiz quiz quiz quiz quiz quiz quiz",
            isRight: false,
            isSelected: false,
          ),
          AwnserWidget(
            title:
                "Teste de resposta do quiz quiz quiz quiz quiz quiz quiz quiz quiz",
            isRight: false,
            isSelected: true,
          ),
          AwnserWidget(
            title:
                "Teste de resposta do quiz quiz quiz quiz quiz quiz quiz quiz quiz",
            isRight: true,
            isSelected: true,
          )
        ],
      ),
    );
  }
}