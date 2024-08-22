import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 16.w),
          itemBuilder: (ctx,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4),
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8.w),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8
              )
            ]
          ),
          child: Row(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Abdulhamid",style: AppStyle.headLine3(Colors.black),),
                  Text("Manzil: Andijon,oltikol",style: AppStyle.headLine4(Colors.grey),),
                ],
              )),
              IconButton(onPressed: (){}, icon: Icon(Icons.flag))
            ],
          ),
        );
      }),
    );
  }
}
