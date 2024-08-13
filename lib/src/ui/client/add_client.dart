import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/widgets/button_widget.dart';
import 'package:stroy_baza/src/widgets/text_field_widget.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerRegion = TextEditingController();
  TextEditingController controllerDistrict = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mijozni qo’shish"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(controller: controllerName,hintText: "F.I.O",),
                  TextFieldWidget(controller: controllerRegion,hintText: "Viloyat",suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,size: 34,),onTap: (){},readOnly: true,),
                  TextFieldWidget(controller: controllerDistrict,hintText: "Tuman",suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,size: 34,),onTap: (){},readOnly: true,),
                  TextFieldWidget(controller: controllerPhone,hintText: "Telfon",),
                  TextFieldWidget(controller: controllerDistrict,hintText: "Joylashuv",suffixIcon: const Icon(Icons.location_on,size: 34,),onTap: (){},readOnly: true,),
                ],
              ),
            ),
          ),
          SizedBox(height: 14.h,),
          ButtonWidget(height: 56, onTap: (){}, text: "Saqlash", color: AppColors.blue, textColor: Colors.white),
          SizedBox(height: 34.h,)
        ],
      ),
    );
  }
}
