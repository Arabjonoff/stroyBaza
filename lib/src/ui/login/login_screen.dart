import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo.png',width: 200.r,)),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text("Kirish",style: AppStyle.headLine1(AppColors.black),),
          ),
          TextFieldWidget(controller: controllerPhone,hintText: "Telfon raqam",),
          TextFieldWidget(controller: controllerPassword,hintText: "Parol",),
        ],
      ),
    );
  }
}
