import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomDialog{
  static showBottomDialog(BuildContext context,Widget screen,double height){
    showModalBottomSheet(
      isScrollControlled: true,
        context: context, builder: (ctx){
      return Container(
        height: height.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: screen),
      );
    });
  }
}