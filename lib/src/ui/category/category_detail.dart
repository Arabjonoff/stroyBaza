import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/widgets/button_widget.dart';
import 'package:stroy_baza/src/widgets/text_field_widget.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  int selectedIndex = 0;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yong’oq 4x20cm"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 314.h,
                    child: PageView.builder(
                      onPageChanged: (index){
                        selectedIndex = index;
                        setState(() {});
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (ctx,index){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8),
                        width: 350.w,
                        height: 314.h,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Qoldiq:",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(" 1 500 dona")
                          ],
                        ),
                        Row(
                          children: [
                            Text("Kategoriyasi:",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("Yog’ochlar")
                          ],
                        ),
                        Row(
                          children: [
                            Text("Razmeri:",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("4x20cm")
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextFieldWidget(controller: controller,prefix: Padding(padding: EdgeInsets.only(top: 14.w), child: Text("Oddiy: ",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),),
                  TextFieldWidget(controller: controller,prefix: Padding(
                    padding: EdgeInsets.only(top: 14.w),
                    child: Text("Optom: ",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),),
                ],
              ),
            ),
          ),
          ButtonWidget(height: 64, onTap: (){}, text: "Savatga qo’shish", color: AppColors.blue, textColor: Colors.white),
          SizedBox(height: 34.h,)
        ],
      ),
    );
  }
  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive
            ? 10:8.0,
        width: isActive
            ? 12:8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
              color: AppColors.black,
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(
                0.0,
                0.0,
              ),
            )
                : const BoxShadow(
              color: Colors.transparent,
            )
          ],
          shape: BoxShape.circle,
          color: isActive ? AppColors.black : const Color(0XFFEAEAEA),
        ),
      ),
    );
  }
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }
}
