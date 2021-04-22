import 'package:quiz_dev/core/core.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  const ProgressBar({
    Key? key, required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}