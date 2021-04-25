import 'package:quiz_dev/challenge/widgets/answer/answer_widget.dart';
import 'package:quiz_dev/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:quiz_dev/shared/models/quiz_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onAnswerSelected;

  QuizWidget({Key? key, required this.question, required this.onAnswerSelected}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;
  bool isLocked = false;

  AnswerModel getAnswer(int i) => widget.question.answers[i];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (int i = 0 ; i < widget.question.answers.length; i++)
            AnswerWidget(
              isSelected: selectedIndex == i,
              answer: getAnswer(i),
              isDisabled: isLocked,
              onTap: (){
                selectedIndex = i;
                isLocked = true;
                setState(() { });
                Future.delayed(Duration(seconds: 1)).then((value) => {
                  widget.onAnswerSelected(getAnswer(i).isRight)
                });
              }
            )
        ],
      ),
    );
  }
}