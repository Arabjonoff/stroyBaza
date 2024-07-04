import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      height: 140.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 8.r,
            color: AppColors.grey
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 140.w,
            height: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15))
            ),
          ),
          SizedBox(width: 8.w,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Yong’oq 4x20cm",style: AppStyle.headLine2(AppColors.black),),
              Text("Optom: 20 000 uzs",style: AppStyle.headLine2(AppColors.black),),
              Row(
                children: [

                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
