import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 16.w),
          itemBuilder: (ctx,index){
        return ListTile(
          title: Text("Andijon",style: AppStyle.headLine3(Colors.black),),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      }),
    );
  }
}
