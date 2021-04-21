import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/models.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);

  HomeState get state => stateNotifier.value;
  set state(HomeState state) => stateNotifier.value = state;

  UserModel? user;
  List<QuizModel>? quizzes;

  final homeRepository = HomeRepository();

  void fetchUser() async {
    state = HomeState.loading;
    user = await homeRepository.getUser();
    state = HomeState.success;
  }

  void fetchQuizzes() async {
    state = HomeState.loading;
    quizzes = await homeRepository.getQuizzes();
    state = HomeState.success;
  }
}
