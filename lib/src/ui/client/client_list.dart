import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/bloc/client/client_bloc.dart';
import 'package:stroy_baza/src/model/client/client_model.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

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
                          return Container(
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
                                IconButton(onPressed: (){}, icon: Icon(Icons.flag))
                              ],
                            ),
                          );
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
