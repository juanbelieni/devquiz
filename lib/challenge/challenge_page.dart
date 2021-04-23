import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/models.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;

  const ChallengePage({required this.quiz});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeController = ChallengeController();
  final pageController = PageController();

  List<QuestionModel> get questions => widget.quiz.questions;

  bool get isLastQuestion =>
      challengeController.currentPage == questions.length - 1;

  @override
  void initState() {
    super.initState();

    challengeController.currentPageNotifier.addListener(() {
      setState(() {});
    });

    pageController.addListener(() {
      setState(() {
        challengeController.currentPage = pageController.page!.toInt();
      });
    });
  }

  void nextPage(BuildContext context) {
    if (!isLastQuestion) {
      pageController.nextPage(
        duration: Duration(milliseconds: 250),
        curve: Curves.linear,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            quiz: widget.quiz,
            rightAnswers: challengeController.rightAnswers,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: challengeController.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value + 1,
                  length: questions.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: questions
            .map(
              (question) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: QuizWidget(
                  question: question,
                  onAnswer: (isRight) {
                    if (isRight) {
                      challengeController.rightAnswers += 1;
                    }
                    nextPage(context);
                  },
                ),
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: NextButtonWidget.white(
            label: "Pular",
            onTap: () => nextPage(context),
          ),
        ),
      ),
    );
  }
}
