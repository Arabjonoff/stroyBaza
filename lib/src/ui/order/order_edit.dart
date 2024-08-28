import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/bloc/order/order_bloc.dart';
import 'package:stroy_baza/src/dialog/bottom_dialog.dart';
import 'package:stroy_baza/src/model/order/order_list_model.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/ui/client/client_list.dart';
import 'package:stroy_baza/src/widgets/button_widget.dart';
import 'package:stroy_baza/src/widgets/text_field_widget.dart';

class OrderEditScreen extends StatefulWidget {
  final OrderResult data;
  const OrderEditScreen({super.key, required this.data});

  @override
  State<OrderEditScreen> createState() => _OrderEditScreenState();
}

class _OrderEditScreenState extends State<OrderEditScreen> {
  final Repository _repository = Repository();
  TextEditingController controllerClient = TextEditingController();
  TextEditingController controllerClientId = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerComment = TextEditingController();
   TextEditingController _controllerDate = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  @override
  void initState() {
    controllerClient.text = widget.data.client.fio;
    controllerClientId.text = widget.data.id.toString();
    _controllerDate.text = widget.data.dedline;
    controllerComment.text = widget.data.comment;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Buyurtmalar"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: controllerClient,
                    hintText: "Klientni tanlang",
                    readOnly: true,),
                  Container(
                    height: 80.h,
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
                        Text("Manzil: ${widget.data.client.address}",style: AppStyle.headLine3(Colors.black),),
                        Text("Telefon: ${widget.data.client.phone}",style: AppStyle.headLine3(Colors.black),),
                      ],
                    ),
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
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16),
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow:  [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 5,
                  offset: Offset(0,1)
                )
              ]
            ),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                Text("${widget.data.items.length} ta mahsulot",style: AppStyle.headLine3(Colors.black),),
              ],
            ),
          ),
          ButtonWidget(height: 48, onTap: ()async{
            orderBloc.updateOrder({
                  "comment":controllerComment.text,
                  "dedline":_controllerDate.text
                }, widget.data.id,context);
          }, text: "Yangilash", color: AppColors.blue, textColor: Colors.white),
          SizedBox(height: 32.h,),
        ],
      ),
    );
  }
}
