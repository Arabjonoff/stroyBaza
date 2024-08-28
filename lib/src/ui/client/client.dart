import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/bloc/client/client_bloc.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/ui/client/add_client.dart';
import 'package:stroy_baza/src/ui/client/client_list.dart';
import 'package:stroy_baza/src/ui/district/district_screen.dart';
import 'package:stroy_baza/src/ui/region/region_screen.dart';

class ClientScreen extends StatefulWidget {
  final Function(int) switchTab;
  const ClientScreen({super.key, required this.switchTab});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen>with SingleTickerProviderStateMixin {
  int index = 0,bookmark=0;
  late TabController tabController;
  late PageController _pageController;
  @override
  void initState() {
    clientBloc.getAllClient('');
    tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: tabController,
                onTap: (index) {
                  _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
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
      body:  PageView(
        controller: _pageController,
        onPageChanged: (index) {
          tabController.animateTo(index);
        },
        children: [
          ClientListScreen(bookmark: bookmark,),
          RegionScreen(onTap: false, switchTab: (int ) {  },),
          const DistrictScreen(obj: '',appBar: true,)
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
    );
  }
}
