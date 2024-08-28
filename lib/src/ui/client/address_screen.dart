import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/bloc/district/district_bloc.dart';
import 'package:stroy_baza/src/bloc/region/region_bloc.dart';
import 'package:stroy_baza/src/model/district/discrit_model.dart';
import 'package:stroy_baza/src/model/region/region_model.dart';
import 'package:stroy_baza/src/theme/app_style.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    regionBloc.getRegionAll();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<RegionResult>>(
        stream: regionBloc.getRegionStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data =snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
                padding: EdgeInsets.only(top: 16.w),
                itemBuilder: (ctx,index){
                  return ListTile(
                    title: Text(data[index].name,style: AppStyle.headLine3(Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                });
          }
          return SizedBox();
        }
      ),
    );
  }
}
