import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stroy_baza/src/bloc/order/order_bloc.dart';
import 'package:stroy_baza/src/model/order/order_list_model.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/ui/order/order_edit.dart';

class OrderListScreen extends StatefulWidget {
  final int status;
  const OrderListScreen({super.key, required this.status});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  void initState() {
    orderBloc.getAllOrder();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:StreamBuilder<OrderListModel>(
        stream: orderBloc.getOrderStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data!.data.data;
            return ListView.builder(
              itemCount: data.length,
                padding: EdgeInsets.only(top: 12.h),
                itemBuilder: (ctx,index){
                if(widget.status==5){
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (i){},
                          icon: Icons.delete,
                          foregroundColor: Colors.red,
                          label: "O'chirish",
                        )
                      ],
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx){
                          return OrderEditScreen(data: data[index]);
                        }));
                      },
                      child: Container(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data[index].client.fio,style: AppStyle.headLine3(Colors.black),),
                                Tooltip(
                                  message: data[index].comment,
                                  child: const Icon(Icons.chat_bubble_outline_outlined),
                                )
                              ],
                            ),
                            Text("Manzil: Andijon ,Oltinkol",style: AppStyle.headLine4(Colors.black),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Yetkazib berish: ${data[index].createdDate}",style: AppStyle.headLine4(Colors.black),),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.orange
                                  ),
                                  child: Text(data[index].getStatusDisplay,style: AppStyle.headLine4(Colors.black),),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                 if(widget.status>=1&&widget.status<5){
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (i){
                            orderBloc.deleteOrder(data[index].id, context);
                          },
                          icon: Icons.delete,
                          foregroundColor: Colors.red,
                          label: "O'chirish",
                        )
                      ],
                    ),
                    child: Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data[index].client.fio,style: AppStyle.headLine3(Colors.black),),
                              Tooltip(
                                message: data[index].comment,
                                child: const Icon(Icons.chat_bubble_outline_outlined),
                              )
                            ],
                          ),
                          Text("Manzil: ${data[index].client.address}",style: AppStyle.headLine4(Colors.black),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Yetkazib berish: ${data[index].dedline}",style: AppStyle.headLine4(Colors.black),),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange
                                ),
                                child: Text(data[index].getStatusDisplay,style: AppStyle.headLine4(Colors.black),),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
                else{
                  return Container();
                }
                });
          }else{
            return Center(
              child: LoadingAnimationWidget.newtonCradle(
                color: AppColors.greenAccent,
                size: 80.r,
              ),
            );
          }
        }
      )
    );
  }
}
