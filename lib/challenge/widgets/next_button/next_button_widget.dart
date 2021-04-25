import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_dev/core/core.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap
  }) : super(key: key);

  NextButtonWidget.green({required String label, required this.onTap})
    : this.label = label,
      this.backgroundColor= AppColors.darkGreen,
      this.fontColor = AppColors.white,
      this.borderColor = AppColors.darkGreen;

  NextButtonWidget.purple({required String label, required this.onTap})
    : this.label = label,
      this.backgroundColor= AppColors.purple,
      this.fontColor = AppColors.white,
      this.borderColor = AppColors.purple;

  NextButtonWidget.white({required String label, required this.onTap})
    : this.label = label,
      this.backgroundColor = AppColors.white,
      this.fontColor = AppColors.grey,
      this.borderColor = AppColors.border;

  NextButtonWidget.transparent({required String label, required this.onTap})
    : this.label = label,
      this.backgroundColor = Colors.transparent,
      this.fontColor = AppColors.grey,
      this.borderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(fontWeight: FontWeight.w600, fontSize: 15, color: fontColor),
        )
      )
    );
  }
}