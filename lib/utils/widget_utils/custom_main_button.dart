import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;

  final Color? borderColor;
  final Color? bgColor;
  final Color? textColor;
  final Function()? ontap;
  const CustomButton({
    super.key,
    required this.title,
    required this.width,

    this.bgColor,
    this.borderColor,
    this.textColor,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 55,
        width: width,

        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor ?? AppColors.mainColor),
        ),
        child: Center(
          child: Text(
            title,
            style: h2.copyWith(color: textColor ?? AppColors.white),
          ),
        ),
      ),
    );
  }
}
