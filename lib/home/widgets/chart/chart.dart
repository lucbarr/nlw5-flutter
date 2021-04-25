import 'package:quiz_dev/core/app_colors.dart';
import 'package:quiz_dev/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  final double completionValue;

  const Chart({Key? key, required this.completionValue}) : super(key: key);
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = Tween<double>(begin: 0.0, end: widget.completionValue).animate(_controller);
    _controller.forward();
  }

  @override 
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => 
          Stack(
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: _animation.value,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor: AlwaysStoppedAnimation<Color> (AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(child: Text("${(_animation.value * 100).toInt()}%", style: AppTextStyles.heading))
          ],
        ),
      )
    );
  }
}