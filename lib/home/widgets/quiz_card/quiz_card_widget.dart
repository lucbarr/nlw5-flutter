import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 160,
      height: 177,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(BorderSide(width: 1, color: AppColors.defaultCardBorder))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset(AppImages.blocks),
            width: 40,
            height: 40,
          ),
          SizedBox(height: 24),
          Text("State management", style: AppTextStyles.heading15),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text("3/10", style: AppTextStyles.body11)
              ),
              Expanded(
                  flex: 4,
                  child: ProgressBar(value: 0.3),
              ),
            ],
          )
        ],
      ),
    );
  }
}