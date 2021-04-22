import 'package:quiz_dev/home/home_repository.dart';
import 'package:quiz_dev/shared/models/quiz_model.dart';
import 'package:quiz_dev/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'home_repository.dart';
import 'home_state.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier = ValueNotifier<HomeState>(HomeState.Empty);

  final repository = HomeRepository();

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;


  void getUser() async {
    state = HomeState.Loading;
    user = await repository.getUser();

    state = HomeState.Success;
  }

  void getQuizzes() async {
    state = HomeState.Loading;

    quizzes = await repository.getQuizzes();

    state = HomeState.Success;
  }
}