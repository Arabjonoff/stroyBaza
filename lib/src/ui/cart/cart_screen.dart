import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/bloc/cart/cart_bloc.dart';
import 'package:stroy_baza/src/model/order/order_model.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/ui/cart/cart_order.dart';
import 'package:stroy_baza/src/widgets/button_widget.dart';
import 'package:stroy_baza/src/widgets/text_field_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<TextEditingController> _controllersCount = [];
  List<TextEditingController> _controllersPrice = [];
  final Repository _repository = Repository();
  @override
  void initState() {
    cartBloc.getCartAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text("Savat"),
        actions: [
          IconButton(onPressed: ()async{
            await _repository.clearOrderBase();
            await cartBloc.getCartAll();
          }, icon: const Icon(Icons.delete_forever_rounded,size: 34,color: Colors.red,))
        ],
      ),
      body: StreamBuilder<List<OrderModel>>(
        stream: cartBloc.getCartStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context,index){
                        _controllersCount.add(TextEditingController());
                        _controllersPrice.add(TextEditingController());
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 14.w,vertical: 8.h),
                          width: MediaQuery.of(context).size.width,
                          height: 140.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey,blurRadius: 5)
                              ],
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 140.w,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),topLeft: Radius.circular(15))
                                ),
                              ),
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8.h,),
                                  Text(data[index].name,style: AppStyle.headLine3(Colors.black),),
                                  Text('Optom: 20 000 uzs',style: AppStyle.headLine4(Colors.black),),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 34.h,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: 16.w),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(15)
                                                )
                                            ),
                                            controller: _controllersPrice[index],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8.h,),
                                      Expanded(
                                        child: SizedBox(
                                          height: 34.h,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: 16.w),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(15)
                                                )
                                            ),
                                            controller: _controllersCount[index],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8.h,),
                                    ],
                                  ),
                                  SizedBox(height: 12.h,)
                                ],
                              ))
                            ],
                          ),
                        );
                      }),
                ),
                Row(
                  children: [
                    Expanded(child: ButtonWidget(height: 64.h, onTap: (){}, text: "Bekor qilish", color: Colors.red, textColor: Colors.white)),
                    Expanded(child: ButtonWidget(height: 64.h, onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return CartOrderScreen();
                      }));
                    }, text: "Davom etish", color: AppColors.blue, textColor: Colors.white)),
                  ],
                ),
                SizedBox(height: 34.h,)
              ],
            );
          }
          return const SizedBox();
        }
      ),
    );
  }
}
