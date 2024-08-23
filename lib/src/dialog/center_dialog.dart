import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class CenterDialog {
  static showDialogAlert(BuildContext context, String title,onTapButtonText,Color color ,textColor,Function() onTap) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
            content: Container(
              height: 140.r,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 20.w,),
                  Text(
                    title,
                    style: AppStyle.headLine3(color),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SizedBox(width: 16.w,),
                      Expanded(
                          child:GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 12.r,horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.grey),
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Text("Orqaga qaytish",style: AppStyle.headLine4(Colors.red),),
                            ),
                          )
                      ),
                      SizedBox(width: 12.w,),
                      Expanded(
                          child:GestureDetector(
                            onTap: onTap,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 12.r,horizontal: 12),
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: Text(onTapButtonText,style: AppStyle.headLine4(textColor),),
                            ),
                          )
                      ),
                      SizedBox(width: 16.w,),
                    ],
                  ),
                  SizedBox(
                    height: 22.w,
                  ),
                ],
              ),
            ),
          );
        });
  }

  static showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return SizedBox(
            width: 80.r,
            height: 80.r,
            child: Center(
              child: LoadingAnimationWidget.waveDots(
                color: AppColors.greenAccent,
                size: 80.r,
              ),
            ),
          );
        });
  }

  static showScreenDialog(BuildContext context,Widget screen){
    showDialog(context: context, builder: (ctx){
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
        content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 340.h,
            child: screen),
      );
    });
  }
}
