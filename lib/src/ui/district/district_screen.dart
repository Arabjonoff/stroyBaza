import 'package:flutter/material.dart';
import 'package:stroy_baza/src/bloc/district/district_bloc.dart';
import 'package:stroy_baza/src/model/district/discrit_model.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/utils/rx_bus.dart';

class DistrictScreen extends StatefulWidget {
  final bool appBar;
  final String obj;
  const DistrictScreen({super.key, required this.obj, this.appBar = false});

  @override
  State<DistrictScreen> createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  @override
  void initState() {
    districtBloc.getDistrictAll(widget.obj);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: widget.appBar?true:false,
        title: Text("Tumanlar"),
      ),
      body: StreamBuilder<List<DistrictResult>>(
          stream: districtBloc.getDistrictStream,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              var data = snapshot.data!;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (ctx,index){
                    return ListTile(
                      onTap: ()async{
                        RxBus.post(data[index].name,tag: 'districtName');
                        RxBus.post(data[index].id.toString(),tag: 'districtId');
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
