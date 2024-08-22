import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/dialog/bottom_dialog.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/ui/client/map/map_screen.dart';
import 'package:stroy_baza/src/ui/district/district_screen.dart';
import 'package:stroy_baza/src/ui/region/region_screen.dart';
import 'package:stroy_baza/src/utils/rx_bus.dart';
import 'package:stroy_baza/src/widgets/button_widget.dart';
import 'package:stroy_baza/src/widgets/text_field_widget.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerRegion = TextEditingController();
  TextEditingController controllerRegionId = TextEditingController();
  TextEditingController controllerDistrict = TextEditingController();
  TextEditingController controllerDistrictId = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerLatitude = TextEditingController();
  TextEditingController controllerLongitude = TextEditingController();
  final Repository _repository = Repository();
  @override
  void initState() {
    _initBus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mijozni qo’shish"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(controller: controllerName,hintText: "F.I.O",),
                  TextFieldWidget(controller: controllerRegion,hintText: "Viloyat",suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,size: 34,),onTap: ()async{
                    BottomDialog.showBottomDialog(context, const RegionScreen(),300);
                  },readOnly: true,),
                  TextFieldWidget(controller: controllerDistrict,hintText: "Tuman",suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,size: 34,),onTap: (){
                    BottomDialog.showBottomDialog(context,  DistrictScreen(obj: controllerRegionId.text,),300);
                  },readOnly: true,),
                  TextFieldWidget(controller: controllerPhone,hintText: "Telfon",),
                  TextFieldWidget(controller: controllerLongitude,hintText: "Joylashuv",suffixIcon: const Icon(Icons.location_on,size: 34,),onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx){
                      return const MapScreen();
                    }));
                  },readOnly: true,),
                ],
              ),
            ),
          ),
          SizedBox(height: 14.h,),
          ButtonWidget(height: 56, onTap: ()async{
            Map data = {
              "district":1,
              "fio":controllerName.text,
              "phone":controllerPhone.text,
              "telegram_id":"11223365471",
              "address":"namangan",
              "latitude":3,
              "longitude":33

            };
            HttpResult res = await _repository.clientAdd(data);
          }, text: "Saqlash", color: AppColors.blue, textColor: Colors.white),
          SizedBox(height: 34.h,)
        ],
      ),
    );
  }
  _initBus(){
    RxBus.register(tag: "regionName").listen((event) {
      controllerRegion.text = event;
    });
    RxBus.register(tag: "regionId").listen((event) {
      controllerRegionId.text = event;
    });
    RxBus.register(tag: "districtName").listen((event) {
      controllerDistrict.text = event;
    });
    RxBus.register(tag: "districtId").listen((event) {
      controllerDistrictId.text = event;
    });
    RxBus.register(tag: "latitude").listen((event) {
     controllerLatitude.text = event;
    });
    RxBus.register(tag: "longitude").listen((event) {
      controllerLongitude.text = event;
    });
  }
}
