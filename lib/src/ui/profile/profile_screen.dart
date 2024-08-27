import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.lock))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0,3)
                )
              ]
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ismi:",style: AppStyle.headLine3(Colors.black),),
                    Text("Abdulhaimd:",style: AppStyle.headLine3(Colors.black),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Familya:",style: AppStyle.headLine3(Colors.black),),
                    Text("Zuhriddionv:",style: AppStyle.headLine3(Colors.black),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Telefon:",style: AppStyle.headLine3(Colors.black),),
                    Text("94004422",style: AppStyle.headLine3(Colors.black),)
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0,3)
                  )
                ]
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sotdim (UZS):",style: AppStyle.headLine3(Colors.black),),
                    Text("2 000 000",style: AppStyle.headLine3(Colors.black),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sotdim (USD):",style: AppStyle.headLine3(Colors.black),),
                    Text("3 500",style: AppStyle.headLine3(Colors.black),)
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Buyurtmalarim",style: AppStyle.headLine2(Colors.black.withOpacity(0.8)),),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          Expanded(child:
          ListView.builder(itemBuilder: (ctx,index){
            return  Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0,3)
                    )
                  ]
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Abdulhamid Zuhriddion",style: AppStyle.headLine3(Colors.black),),
                  Text("Manzil: Andijon ,Oltinkol",style: AppStyle.headLine4(Colors.black),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Yetkazib berish: bugun",style: AppStyle.headLine4(Colors.black),),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orange
                        ),
                        child: Text("Tasdiqlandi",style: AppStyle.headLine4(Colors.black),),
                      )
                    ],
                  ),
                ],
              ),
            );
          }))
        ],
      ),
    );
  }
}
