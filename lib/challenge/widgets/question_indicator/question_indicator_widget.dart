import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Question 2", style: AppTextStyles.body),
              Text("out of 10", style: AppTextStyles.body),
            ]
          ),
          SizedBox(height: 16),
          ProgressBar(value: 0.7),
        ],
      ),
    );
  }
}