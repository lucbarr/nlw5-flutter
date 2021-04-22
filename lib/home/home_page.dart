import 'package:quiz_dev/core/core.dart';
import 'package:quiz_dev/home/home_controller.dart';
import 'package:quiz_dev/home/home_state.dart';
import 'package:quiz_dev/home/widgets/level_button/level_button_widget.dart';
import 'package:quiz_dev/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/appbar/app_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  Widget _levelCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LevelButtonWidget(
          type: LevelButtonType.Easy,
        ),
        LevelButtonWidget(
          type: LevelButtonType.Hard,
        ),
        LevelButtonWidget(
          type: LevelButtonType.Medium,
        ),
        LevelButtonWidget(
          type: LevelButtonType.Pro,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.Success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 24,),
              _levelCards(),
              SizedBox(height: 24,),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!.map((quiz) {
                    return QuizCardWidget(
                      completed: quiz.questionsAnswered,
                      title: quiz.title,
                      totalQuestions: quiz.questions.length,
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
      ),)
    );
  }
}