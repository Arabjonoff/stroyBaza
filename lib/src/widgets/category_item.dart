import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/model/parametrs/product_model.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final ProductResult data;
  final Function() onTap;
  const CategoryItem({super.key, required this.onTap, required this.data, required this.index});

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
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: CachedNetworkImage(imageUrl: data.productCounts[0].img1,fit: BoxFit.cover,)),
            ),
            Text(data.name,style: AppStyle.headLine3(AppColors.black),maxLines: 1,),
            Text("Optom: ${data.prices[1].wholesalePrice}",style: AppStyle.headLine4(AppColors.grey),),
            Text("Oddiy: ${data.prices[index].unitPrice}",style: AppStyle.headLine4(AppColors.grey),),
            Text("Qoldiq: ${data.productCounts[index].count}",style: AppStyle.headLine4(AppColors.grey),),
          ],
        ),
      ),
    );
  }
}
