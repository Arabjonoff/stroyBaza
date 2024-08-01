import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/ui/category/category_detail.dart';
import 'package:stroy_baza/src/widgets/category_item.dart';

class CategoryScreen extends StatefulWidget {
  final int id;
  final String name;
  const CategoryScreen({super.key, required this.id, required this.name});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(widget.name),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(24.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 8),
            child: CupertinoSearchTextField(
              controller: controllerSearch,
              placeholder: "Nimani qidirmoqchisz?",
            ),
          ),
        ),
      ),
      body: GridView.builder(
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (orientation == Orientation.portrait) ? 0.8 : 1.3,
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (ctx,index){
            return CategoryItem(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return CategoryDetailScreen();
              }));
            });
          }),
    );
  }
}
