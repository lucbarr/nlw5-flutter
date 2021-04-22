import 'package:quiz_dev/core/app_gradients.dart';
import 'package:quiz_dev/core/core.dart';
import 'package:quiz_dev/home/widgets/score_card/score_card.dart';
import 'package:quiz_dev/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user}) : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 161,
            width: double.maxFinite,
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Hello, ", style: AppTextStyles.title),
                    TextSpan(text: user.name, style: AppTextStyles.titleBold)
                  ]
                )),
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage(user.photoURL)),
                  )
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: ScoreCardWidget()
          ),
        ],
      ),
    ),
  );
}