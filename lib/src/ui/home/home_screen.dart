import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stroy_baza/src/bloc/district/district_bloc.dart';
import 'package:stroy_baza/src/bloc/parametrs/category_bloc.dart';
import 'package:stroy_baza/src/bloc/region/region_bloc.dart';
import 'package:stroy_baza/src/model/parametrs/category_model.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/ui/category/category_screen.dart';
import 'package:stroy_baza/src/ui/client/add_client.dart';
import 'package:stroy_baza/src/ui/client/client.dart';
import 'package:stroy_baza/src/ui/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
  categoryBloc.getAllCategory();
  districtBloc.getDistrictAll('');
  regionBloc.getRegionAll();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asosiy"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx){
              return SearchScreen();
            }));
          }, icon: const Icon(Icons.search_rounded,size: 34,))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return ClientScreen();
              }));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.blue
              ),
              child: Row(
                children: [
                  SizedBox(width: 8.w,),
                  const Icon(Icons.person_outlined,color: Colors.white,),
                  SizedBox(width: 8.w,),
                  Text("Mijozlar ro’yxati",style: AppStyle.headLine3(Colors.white),),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  SizedBox(width: 8.w,),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0.w,top: 12.h,bottom: 12.h),
            child: Text("Kategoriyalar",style: AppStyle.headLine2(Colors.black),),
          ),
          Expanded(
            child: StreamBuilder<CategoryModel>(
              stream: categoryBloc.getCategoryStream,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  var data = snapshot.data!.data;
                  return ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (ctx,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx){
                          return CategoryScreen(id: data[index].id, name: data[index].name,);
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 0.r,left: 0.r),
                        margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 4.h),
                        width: MediaQuery.of(context).size.width,
                        height: 134.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage("http://185.237.165.236"+data[index].img),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grey.withOpacity(0.3),
                              blurRadius: 5,
                            )
                          ],
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: double.infinity,
                              decoration:  BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black,
                                    ],
                                    stops: [0.0, 9.0],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    tileMode: TileMode.clamp
                                ),
                                borderRadius: BorderRadius.circular(15)
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.0.w,top: 16.r),
                              child: Text(data[index].name,style: AppStyle.headLine2(Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                }
                return Center(
                  child: LoadingAnimationWidget.newtonCradle(
                    color: AppColors.greenAccent,
                    size: 80.r,
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
