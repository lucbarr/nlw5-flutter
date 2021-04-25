import 'package:flutter/material.dart';
import 'package:quiz_dev/challenge/widgets/next_button/next_button_widget.dart';
import 'package:quiz_dev/core/app_images.dart';
import 'package:quiz_dev/core/app_text_styles.dart';
import 'package:quiz_dev/home/home_page.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String challengeName;
  final int numberOfQuizzes;
  final int score;

  const ResultPage({Key? key, required this.challengeName, required this.numberOfQuizzes, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImages.trophy),
            Column(children: [
              Text("Congrats!", style: AppTextStyles.heading40),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text.rich(
                  TextSpan(
                  style: AppTextStyles.body,
                    children: [
                      TextSpan(text: "You've finished "),
                      TextSpan(text: "\n$challengeName ", style: AppTextStyles.bodyBold),
                      TextSpan(text: "\nwith $score out of $numberOfQuizzes!"),
                    ]
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],),
            Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(label: "Share", onTap: ()=> {
                        Share.share("Finished my DevQuiz on $challengeName with a score of $score out of $numberOfQuizzes!")
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.white(label: "Back to home", onTap: ()=> {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()))
                      }),
                    ),
                  ),
                ],
              )
            ])
          ]
        ),
      )
    );
  }
}