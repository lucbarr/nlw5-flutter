import 'package:quiz_dev/core/app_colors.dart';
import 'package:quiz_dev/core/app_text_styles.dart';
import 'package:quiz_dev/home/widgets/chart/chart.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.fromBorderSide(BorderSide(color: AppColors.defaultCardBorder, width: 1)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Chart(),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Let's start!", style: AppTextStyles.bodyBold),
                      Text("Complete the challenges to level up", style: AppTextStyles.body)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}