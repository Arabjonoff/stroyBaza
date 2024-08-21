import 'package:flutter/material.dart';
import 'package:stroy_baza/src/bloc/region/region_bloc.dart';
import 'package:stroy_baza/src/model/region/region_model.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/utils/rx_bus.dart';

class RegionScreen extends StatefulWidget {
  const RegionScreen({super.key});

  @override
  State<RegionScreen> createState() => _RegionScreenState();
}


class _RegionScreenState extends State<RegionScreen> {
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
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
                itemBuilder: (ctx,index){
              return ListTile(
                onTap: ()async{
                  RxBus.post(data[index].name,tag: 'regionName');
                  RxBus.post(data[index].id.toString(),tag: 'regionId');
                  Navigator.pop(context);
                },
                title: Text(data[index].name,style: AppStyle.headLine3(Colors.black),),
              );
            });
          }
          return const SizedBox();
        }
      ),
    );
  }
}
