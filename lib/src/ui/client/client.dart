import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/bloc/client/client_bloc.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/ui/client/add_client.dart';
import 'package:stroy_baza/src/ui/client/address_screen.dart';
import 'package:stroy_baza/src/ui/client/client_list.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  int index = 0,bookmark=0;
  @override
  void initState() {
    clientBloc.getAllClient('');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            index==0?'Mijozlar':"Manzillar",
          ),
          actions: [
            index==1?const SizedBox():IconButton(onPressed: ()async{
              if(bookmark==0){
                bookmark =1;
              }else{
                bookmark =0;
              }setState(() {

              });
            }, icon: Icon(bookmark==0?Icons.bookmark_border:Icons.bookmark,color: AppColors.blue,))
          ],
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 44.r,
                padding: EdgeInsets.symmetric(vertical: 4.r,horizontal: 4.r),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppColors.grey.withOpacity(0.4),
                ),
                child: TabBar(
                  onTap: (i){
                    index = i;
                    setState(() {});
                  },
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Tab(
                      child: Text("Mijozlar",style: AppStyle.headLine4(Colors.black),),
                    ),
                    Tab(
                      child: Text("Manzillar",style: AppStyle.headLine4(Colors.black),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body:  TabBarView(
          children: [
            ClientListScreen(bookmark: bookmark,),
            const AddressScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx){
              return const AddClientScreen();
            }));
          },
          backgroundColor: AppColors.blue,
          child: Icon(Icons.add,size: 34.r,color: Colors.white,),
        ),
      ),
    );
  }
}
