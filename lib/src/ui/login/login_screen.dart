import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/dialog/center_dialog.dart';
import 'package:stroy_baza/src/dialog/toast_dialog.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/ui/main_screen.dart';
import 'package:stroy_baza/src/utils/cache.dart';
import 'package:stroy_baza/src/widgets/button_widget.dart';
import 'package:stroy_baza/src/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Repository _repository = Repository();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h,),
                  Center(child: Image.asset('assets/images/logo.png',width: 200.r,)),
                  Padding(
                    padding:  EdgeInsets.only(left: 12.0,top: 50.h),
                    child: Text("Kirish",style: AppStyle.headLine1(AppColors.black),),
                  ),
                  TextFieldWidget(controller: controllerPhone,hintText: "Telfon raqam",),
                  TextFieldWidget(controller: controllerPassword,hintText: "Parol",),
                ],
              ),
            ),
          ),
          ButtonWidget(height: 64, onTap: ()async{
            CenterDialog.showLoadingDialog(context);
            HttpResult res = await _repository.login(controllerPhone.text, controllerPassword.text);
            if(res.result["success"] == true){
              CacheService.token(res.result["token"]);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
                return const MainScreen();
              }));
              Navigator.popUntil(context, (route) => route.isFirst);
            }
            else{
              if(context.mounted)Navigator.pop(context);
              ToastDialog.showErrorToast(context, res.result["status"].toString());
            }
          }, text: "Tasdiqlash", color: AppColors.blue, textColor: Colors.white),
          SizedBox(height: 34.h,)
        ],
      ),
    );
  }
}
