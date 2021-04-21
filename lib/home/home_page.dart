import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    super.initState();

    homeController.fetchUser();
    homeController.fetchQuizzes();

    homeController.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (homeController.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: homeController.user!,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 20),
                  LevelButtonWidget(label: 'Fácil'),
                  SizedBox(width: 8),
                  LevelButtonWidget(label: 'Médio'),
                  SizedBox(width: 8),
                  LevelButtonWidget(label: 'Difícil'),
                  SizedBox(width: 8),
                  LevelButtonWidget(label: 'Perito'),
                  SizedBox(width: 20),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: const EdgeInsets.only(bottom: 16),
                    children: homeController.quizzes!
                        .map((quiz) => QuizCardWidget(quiz: quiz))
                        .toList()),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
