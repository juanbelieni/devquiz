import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:devquiz/core/core.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color fontColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.fontColor,
    required this.onTap,
  });

  NextButtonWidget.green({required this.label, required this.onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.borderColor = AppColors.darkGreen,
        this.fontColor = AppColors.white;

  NextButtonWidget.purple({required this.label, required this.onTap})
      : this.backgroundColor = AppColors.purple,
        this.borderColor = AppColors.purple,
        this.fontColor = AppColors.white;

  NextButtonWidget.white({required this.label, required this.onTap})
      : this.backgroundColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.fontColor = AppColors.lightGrey;

  NextButtonWidget.transparent({required this.label, required this.onTap})
      : this.backgroundColor = Colors.transparent,
        this.borderColor = Colors.transparent,
        this.fontColor = AppColors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
