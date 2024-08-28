import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/bloc/cart/cart_bloc.dart';
import 'package:stroy_baza/src/bloc/client/client_bloc.dart';
import 'package:stroy_baza/src/dialog/bottom_dialog.dart';
import 'package:stroy_baza/src/dialog/center_dialog.dart';
import 'package:stroy_baza/src/dialog/toast_dialog.dart';
import 'package:stroy_baza/src/model/client/client_model.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/model/order/order_model.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/ui/client/client_list.dart';
import 'package:stroy_baza/src/ui/main_screen.dart';
import 'package:stroy_baza/src/utils/rx_bus.dart';
import 'package:stroy_baza/src/widgets/button_widget.dart';
import 'package:stroy_baza/src/widgets/text_field_widget.dart';

class CartOrderScreen extends StatefulWidget {
  const CartOrderScreen({super.key});

  @override
  State<CartOrderScreen> createState() => _CartOrderScreenState();
}

class _CartOrderScreenState extends State<CartOrderScreen> {
  final Repository _repository = Repository();
  TextEditingController controllerClient = TextEditingController();
  TextEditingController controllerClientId = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerComment = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  @override
  void initState() {
    _initBus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text("Buyurtma qilish"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                TextFieldWidget(
                  onTap: (){
                    BottomDialog.showBottomDialog(context, const ClientListScreen(bookmark: 0), 600.h);
                  },
                  controller: controllerClient,
                  hintText: "Klientni tanlang",
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp,size: 34,),
                  readOnly: true,),
                StreamBuilder<List<ClientResult>>(
                  stream: clientBloc.getClientStream,
                  builder: (context, snapshot) {
                   if(snapshot.hasData){
                     var data = snapshot.data;
                     return Container(
                       height: 130.h,
                       padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8),
                       margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8),
                       width: MediaQuery.of(context).size.width,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(15),
                           boxShadow:  const [
                             BoxShadow(
                                 blurRadius: 2,
                                 color: Colors.grey,
                                 offset: Offset(0,2)
                             )
                           ]
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Manzil: ${data![0].address}",style: AppStyle.headLine3(Colors.black),),
                           Text("Telefon: ${data[0].phone}",style: AppStyle.headLine3(Colors.black),),
                           Text("",style: AppStyle.headLine3(Colors.black),),
                           Text("Qarzi(UZS): ${data[0].uzsSum}",style: AppStyle.headLine3(Colors.black),),
                           Text("Qarzi(USD): ${data[0].usdSum}",style: AppStyle.headLine3(Colors.black),),
                         ],
                       ),
                     );
                   }else{
                     return Container(
                       alignment: Alignment.center,
                       height: 130.h,
                       padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8),
                       margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8),
                       width: MediaQuery.of(context).size.width,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(15),
                           boxShadow:  const [
                             BoxShadow(
                                 blurRadius: 2,
                                 color: Colors.grey,
                                 offset: Offset(0,2)
                             )
                           ]
                       ),
                       child: Text("Kilent ma'lumotlari",style: AppStyle.headLine2(Colors.grey),)
                     );
                   }
                  }
                ),
                TextFieldWidget(
                  onTap: (){
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.parse(_controllerDate.text),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2090),
                    ).then((selectedDate) {
                      // After selecting the date, display the time picker.
                      if (selectedDate != null) {
                        DateTime selectedDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                        );
                        _controllerDate.text = DateFormat('yyyy-MM-dd').format(selectedDateTime);
                        setState(() {});
                      }
                    });
                  },
                  controller: _controllerDate,
                  hintText: "Yetkazib berish vaqti",
                  suffixIcon: const Icon(Icons.calendar_month,),
                  readOnly: true,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: MediaQuery.of(context).size.width,
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)
                  ),
                  child: TextField(
                    controller: controllerComment,
                    maxLines: 8,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Izoh (Ixtiyori)"
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonWidget(height: 64, onTap: ()async{

            CenterDialog.showLoadingDialog(context);
            List<OrderModel> dataBase = await _repository.getOrderBase();
            List<OrderModel> items = <OrderModel>[];
            for(int i =0; i<dataBase.length;i++){
              OrderModel order = OrderModel(
                  id: dataBase[i].id,
                  count: dataBase[i].count,
                  price: dataBase[i].price,
                  image: dataBase[i].image,
                  name: dataBase[i].name,
                  priceType: dataBase[i].priceType,
                  currency: dataBase[i].currency,
              );
              items.add(order);
            }
            Map data = {
              "client":controllerClientId.text,
              "currency":0,
              "dedline":_controllerDate.text,
              "comment":controllerComment.text,
              "items":items
            };
            HttpResult res = await _repository.orderAdd(data);
            if(res.result["success"]==true){
              await cartBloc.clear();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
                return const MainScreen();
              }));
              Navigator.popUntil(context, (route) => route.isFirst);
              ToastDialog.showSuccessToast(context, "Buyurtma yuborildi");
            }
            else{
              ToastDialog.showErrorToast(context, res.result["error"]);
              Navigator.pop(context);
            }
          }, text: "Buyurtmani yuborish", color: AppColors.blue, textColor: Colors.white),
          SizedBox(height: 34.h,)
        ],
      ),
    );
  }
  _initBus(){
    RxBus.register(tag: "clientName").listen((event) {
      controllerClient.text = event;
    });
    RxBus.register(tag: "clientId").listen((event) {
      controllerClientId.text = event;
    });
  }
}
