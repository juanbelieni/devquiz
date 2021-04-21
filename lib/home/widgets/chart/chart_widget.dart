import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/models.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final UserModel user;

  ChartWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: user.score / 100,
                backgroundColor: AppColors.chartSecondary,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
            child: Text("${user.score}%", style: AppTextStyles.heading),
          )
        ],
      ),
    );
  }
}
