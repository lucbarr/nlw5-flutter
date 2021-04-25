import 'package:quiz_dev/core/core.dart';
import 'package:quiz_dev/shared/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int completed;
  final int totalQuestions;
  final VoidCallback onTap;

  const QuizCardWidget({Key? key, required this.title, required this.completed, required this.totalQuestions, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            Text(title, style: AppTextStyles.heading15),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text('$completed/$totalQuestions', style: AppTextStyles.body11)
                ),
                Expanded(
                    flex: 4,
                    child: ProgressBar(value: (completed.toDouble()/totalQuestions)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}