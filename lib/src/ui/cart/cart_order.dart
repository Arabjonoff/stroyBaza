import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/dialog/bottom_dialog.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/ui/client/client_list.dart';
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
                    BottomDialog.showBottomDialog(context, const ClientListScreen(bookmark: 0), 500);
                  },
                  controller: controllerClient,
                  hintText: "Klientni tanlang",
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp,size: 34,),
                  readOnly: true,),
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
                TextFieldWidget(
                  controller: controllerComment,
                  hintText: "Izoh (ixtiyori)",
                ),
              ],
            ),
          ),
          ButtonWidget(height: 64, onTap: ()async{
            Map data = {
              "client":controllerClientId.text,
              "currency":0,
              "dedline":_controllerDate.text,
              "comment":controllerComment.text,
              "items":[
              {
                "id":4,
                "count":15,
                "price":100,
                "currency":"usd"
              },
              ]
            };
            HttpResult res = await _repository.orderAdd(data);
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
