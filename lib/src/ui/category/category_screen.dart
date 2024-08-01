import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stroy_baza/src/bloc/parametrs/product_bloc.dart';
import 'package:stroy_baza/src/model/parametrs/product_model.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
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
  @override
  void initState() {
    productBloc.getProductAll(widget.id);
    super.initState();
  }
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
      body: StreamBuilder<ProductModel>(
        stream: productBloc.getProductStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data!.data;
            return GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (orientation == Orientation.portrait) ? 0.8 : 1.3,
                    crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
                itemBuilder: (ctx,index){
                  return CategoryItem(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx){
                      return CategoryDetailScreen();
                    }));
                  }, data: data[index],);
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
    );
  }
}
