import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:toastification/toastification.dart';

class ToastDialog{
  static showSuccessToast(BuildContext context,String text){
    return  toastification.show(
      context: context, // optional if you use ToastificationWrapper
      title: Text("Muvaffaqiyatli",style: AppStyle.headLine3(Colors.white),),
      icon:  Icon(Icons.check_circle_sharp,color: AppColors.white,),
      description: RichText(text: TextSpan(text: text)),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
  static showErrorToast(BuildContext context,String text){
    return  toastification.show(
      backgroundColor: Colors.red,
      context: context, // optional if you use ToastificationWrapper
      title: Text("Xatolik",style: AppStyle.headLine3(Colors.white),),
      icon:  const Icon(Icons.error,color: Colors.white,),
      description: RichText(text: TextSpan(text: text)),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
}