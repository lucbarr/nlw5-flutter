import 'package:quiz_dev/core/core.dart';
import 'package:quiz_dev/shared/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int maxQuestions;

  const QuestionIndicatorWidget({Key? key, required this.currentPage, required this.maxQuestions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Question ${currentPage+1}", style: AppTextStyles.body),
              Text("out of $maxQuestions", style: AppTextStyles.body),
            ]
          ),
          SizedBox(height: 16),
          ProgressBar(value: (currentPage+1).toDouble()/maxQuestions),
        ],
      ),
    );
  }
}