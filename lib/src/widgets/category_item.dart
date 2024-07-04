import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class CategoryItem extends StatelessWidget {
  final Function() onTap;
  const CategoryItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.4),
              blurRadius: 8.r
            )
          ],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130.h,
              // child: ClipRRect(
              //     borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              //     child: CachedNetworkImage(imageUrl: '',fit: BoxFit.cover,)),
            ),
            Text("Sasna 4x20cm",style: AppStyle.headLine3(AppColors.black),),
            Text("Optom: 20 000 uzs",style: AppStyle.headLine4(AppColors.grey),),
            Text("Oddiy: 30 000 uzs",style: AppStyle.headLine4(AppColors.grey),),
            Text("Qoldiq: 1 500 dona",style: AppStyle.headLine4(AppColors.grey),),
          ],
        ),
      ),
    );
  }
}
