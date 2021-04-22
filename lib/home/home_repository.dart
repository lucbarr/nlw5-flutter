import 'dart:convert';

import 'package:quiz_dev/shared/models/quiz_model.dart';
import 'package:quiz_dev/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final userJSON = await rootBundle.loadString("database/user.json");
    return UserModel.fromJson(userJSON);
  }

  Future<List<QuizModel>> getQuizzes() async {
    final quizzesJSON = await rootBundle.loadString("database/quizzes.json");
    var quizzesList = jsonDecode(quizzesJSON) as List;

    return quizzesList.map((quiz) => QuizModel.fromMap(quiz)).toList();
  }
}