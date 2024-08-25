import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText,placeholder;
  final bool keyboardType,readOnly,isPlaceholder,isBorder;
  final Widget? suffixIcon,prefix;
  final Function()? onTap;
  const TextFieldWidget({super.key, required this.controller,this.hintText = '',this.keyboardType =false,this.readOnly =false,this.isPlaceholder =false,this.suffixIcon, this.prefix, this.onTap,this.placeholder = '',this.isBorder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPlaceholder) Padding(
            padding:  EdgeInsets.only(bottom: 8.0.w),
            child: Text(placeholder,style: AppStyle.headLine3(Colors.black),),
          ) else const SizedBox(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: isBorder?AppColors.blue:AppColors.black)
            ),
            child: TextField(
              onTap: onTap,
              readOnly: readOnly,
              keyboardType: keyboardType?TextInputType.number:TextInputType.text,
              style: AppStyle.headLine3(AppColors.black),
              decoration:  InputDecoration(
                suffixIcon: suffixIcon,
                prefixIcon: prefix,
                hintText: hintText,
                border: InputBorder.none,
              ),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
