import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/bloc/client/client_bloc.dart';
import 'package:stroy_baza/src/model/client/client_model.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/utils/rx_bus.dart';

class ClientListScreen extends StatefulWidget {
  final int bookmark;
  const ClientListScreen({super.key, required this.bookmark});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  @override
  void initState() {
    clientBloc.getAllClient('');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ClientResult>>(
        stream: clientBloc.getClientStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data!;
            return RefreshIndicator(
              onRefresh: ()async{
                await clientBloc.clear();
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8),
                    child: CupertinoSearchTextField(
                      placeholder: "Qidiruv...",
                      onChanged: (i){
                        clientBloc.getAllClient(i);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                        padding: EdgeInsets.only(top: 8.w),
                        itemBuilder: (ctx,index){
                        if(widget.bookmark == data[index].bookmark){
                          return GestureDetector(
                            onTap: (){
                              RxBus.post(data[index].id.toString(),tag: "clientId");
                              RxBus.post(data[index].fio,tag: "clientName");
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4),
                              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8.w),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
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
                                      Text(data[index].fio,style: AppStyle.headLine3(Colors.black),),
                                      Text("Manzil: ${data[index].address}",style: AppStyle.headLine4(Colors.grey),),
                                    ],
                                  )),
                                  IconButton(onPressed: () async {
                                    ClientResult item = ClientResult(
                                        id: data[index].id,
                                        district: data[index].district,
                                        fio: data[index].fio,
                                        type: data[index].type,
                                        phone: data[index].phone,
                                        telegramId: data[index].telegramId,
                                        address: data[index].address,
                                        latitude: data[index].latitude,
                                        longitude: data[index].longitude,
                                        uzsAcc: data[index].usdAcc,
                                        usdAcc: data[index].usdAcc,
                                        uzsStart: data[index].uzsStart,
                                        usdStart: data[index].usdStart,
                                        uzsSum: data[index].uzsSum,
                                        usdSum: data[index].usdSum,
                                        bookmark: data[index].bookmark ==0?1:0
                                    );
                                    await clientBloc.updateClient(item);
                                  }, icon: Icon(data[index].bookmark ==0?Icons.bookmark_border:Icons.bookmark,color: AppColors.blue,))
                                ],
                              ),
                            ),
                          );
                        }else{
                          return GestureDetector(
                            onTap: (){
                              RxBus.post(data[index].id.toString(),tag: "clientId");
                              RxBus.post(data[index].fio,tag: "clientName");
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4),
                              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8.w),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
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
                                      Text(data[index].fio,style: AppStyle.headLine3(Colors.black),),
                                      Text("Manzil: ${data[index].address}",style: AppStyle.headLine4(Colors.grey),),
                                    ],
                                  )),
                                  IconButton(onPressed: () async {
                                    ClientResult item = ClientResult(
                                        id: data[index].id,
                                        district: data[index].district,
                                        fio: data[index].fio,
                                        type: data[index].type,
                                        phone: data[index].phone,
                                        telegramId: data[index].telegramId,
                                        address: data[index].address,
                                        latitude: data[index].latitude,
                                        longitude: data[index].longitude,
                                        uzsAcc: data[index].usdAcc,
                                        usdAcc: data[index].usdAcc,
                                        uzsStart: data[index].uzsStart,
                                        usdStart: data[index].usdStart,
                                        uzsSum: data[index].uzsSum,
                                        usdSum: data[index].usdSum,
                                        bookmark: data[index].bookmark ==0?1:0
                                    );
                                    await clientBloc.updateClient(item);
                                  }, icon: Icon(data[index].bookmark ==0?Icons.bookmark_border:Icons.bookmark,color: AppColors.blue,))
                                ],
                              ),
                            ),
                          );
                        }
                        }),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        }
      ),
    );
  }
}
