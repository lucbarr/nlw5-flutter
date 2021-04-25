import 'package:quiz_dev/challenge/challenge_controller.dart';
import 'package:quiz_dev/challenge/widgets/next_button/next_button_widget.dart';
import 'package:quiz_dev/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:quiz_dev/challenge/widgets/quiz/quiz_widget.dart';
import 'package:quiz_dev/result/result_page.dart';
import 'package:quiz_dev/shared/models/quiz_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String quizTitle;

  const ChallengePage({Key? key, required this.questions, required this.quizTitle}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState(){
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt();
    });

    super.initState();
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
              IconButton(icon: Icon(Icons.close), onPressed: () => {
                Navigator.pop(context)
              }),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) =>
                  QuestionIndicatorWidget(currentPage: value, maxQuestions: widget.questions.length)
              ),
            ],
          )
        )
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions.map((question) => QuizWidget(question: question, onAnswerSelected: (isRightAnswer) => {
          if (isRightAnswer) controller.numberOfRightAnswers ++,
          nextPage()
        })).toList(),
        controller: pageController,
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) =>  
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(value < widget.questions.length -1) Expanded(child: NextButtonWidget.white(label: "Skip", onTap: nextPage))
                  else Expanded(child: NextButtonWidget.green(label: "Confirm", onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(
                      challengeName: widget.quizTitle,
                      numberOfQuizzes: widget.questions.length,
                      score: controller.numberOfRightAnswers,
                    )));
                  },))
                ],
            ),
          ),
        ),
      ),
    );
  }

  void nextPage() {
    if (pageController.page!.toInt() < widget.questions.length-1) {
      pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.linear);
    }
  }
}