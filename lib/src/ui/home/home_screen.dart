import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/ui/category/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asosiy"),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx){
              return CategoryScreen();
            }));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 4.h),
            width: MediaQuery.of(context).size.width,
            height: 134.h,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15)
            ),
          ),
        );
      }),
    );
  }
}
