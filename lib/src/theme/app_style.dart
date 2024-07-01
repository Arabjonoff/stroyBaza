import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle{
  static TextStyle headLine1(Color color){
    return TextStyle(
      fontSize: 24.h,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
  static TextStyle headLine2(Color color){
    return TextStyle(
      fontSize: 20.h,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
  static TextStyle headLine3(Color color){
    return TextStyle(
      fontSize: 16.h,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
  static TextStyle headLine4(Color color){
    return TextStyle(
      fontSize: 12.h,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
}