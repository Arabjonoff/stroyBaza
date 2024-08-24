import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/dialog/bottom_dialog.dart';
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
  TextEditingController controllerClient = TextEditingController();
  TextEditingController controllerClientId = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerComment = TextEditingController();
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
                    print("object");
                  },
                  controller: controllerDate,
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
          ButtonWidget(height: 64, onTap: (){}, text: "Buyurtmani yuborish", color: AppColors.blue, textColor: Colors.white),
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
