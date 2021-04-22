import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/appbar/app_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
    return Scaffold(
      appBar: AppBarWidget(),
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
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}