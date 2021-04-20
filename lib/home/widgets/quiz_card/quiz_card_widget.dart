import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.asset(AppImages.blocks),
            ),
            Text(
              "Gerenciamento de Estado",
              style: AppTextStyles.heading15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "3/10",
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(flex: 2, child: ProgressIndicatorWidget(value: 0.3))
              ],
            )
          ],
        ));
  }
}
