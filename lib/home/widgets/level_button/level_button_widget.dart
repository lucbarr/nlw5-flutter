import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//enum LevelButtonType {
//  Easy,
//  Medium,
//  Hard,
//  Pro
//}

class LevelButtonType {

  final String label;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;

  static final Easy = LevelButtonType(
    "Easy",
    AppColors.levelButtonBorderFacil,
    AppColors.levelButtonTextFacil,
    AppColors.levelButtonFacil
  );
  static final Medium = LevelButtonType(
    "Medium",
    AppColors.levelButtonBorderMedio,
    AppColors.levelButtonTextMedio,
    AppColors.levelButtonMedio
  );
  static final Hard = LevelButtonType(
    "Hard",
    AppColors.levelButtonBorderDificil,
    AppColors.levelButtonTextDificil,
    AppColors.levelButtonDificil
  );
  static final Pro = LevelButtonType(
    "Pro",
    AppColors.levelButtonBorderPerito,
    AppColors.levelButtonTextPerito,
    AppColors.levelButtonPerito
  );

  LevelButtonType(this.label, this.borderColor, this.textColor, this.backgroundColor);
}

class LevelButtonWidget extends StatelessWidget {
  final LevelButtonType type;
  LevelButtonWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.fromBorderSide(BorderSide(width: 2, color: type.borderColor))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          type.label,
          style: GoogleFonts.notoSans(
            color: type.textColor,
            fontSize: 13,
          )
        ),
      ),
    );
  }
}