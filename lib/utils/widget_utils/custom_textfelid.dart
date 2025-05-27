import 'package:flutter/material.dart';


import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final double width;
  final double? horizontalPadding;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? sufIcon;
  final Widget? preIcon;
  final int? maxLines;
  final bool? isEnable;
  const CustomTextField({
    super.key,
    required this.title,
    required this.width,
     this.hintText,
     this.controller,
      this.horizontalPadding,
     this.sufIcon,
     this.isEnable,
     this.maxLines,
     this.preIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: h2.copyWith(color: AppColors.textColor),),
        const SizedBox(height: 12,),
        Container(
          height: 45 ,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.gray)
          
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                suffixIcon: sufIcon,
                prefixIcon: preIcon,
                hintText: hintText,
                hintStyle: const TextStyle(color: AppColors.gray,fontSize: 14),
                
    
              ),
              maxLines: maxLines ?? 1,
              style: h2,
              enabled: isEnable ?? true,
              
            ),
          ),
        )
      
      ],
    );
  }
}