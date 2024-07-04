import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class ButtonWidget extends StatelessWidget {
  final double height;
  final Function() onTap;
  final String text;
  final Color color,textColor;
  const ButtonWidget({super.key, required this.height, required this.onTap, required this.text, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        width: MediaQuery.of(context).size.width,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color
        ),
        child: Text(text,style: AppStyle.headLine4(textColor),),
      ),
    );
  }
}
