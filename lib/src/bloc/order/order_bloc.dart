
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/dialog/center_dialog.dart';
import 'package:stroy_baza/src/dialog/toast_dialog.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/model/order/order_list_model.dart';

class OrderBloc {
  final Repository _repository = Repository();
  final _fetchOrderInfo = PublishSubject<OrderListModel>();
  Stream<OrderListModel> get getOrderStream => _fetchOrderInfo.stream;

  getAllOrder()async{
    HttpResult result = await _repository.orderList();
    if(result.isSuccess){
      var data = OrderListModel.fromJson(result.result);
      _fetchOrderInfo.sink.add(data);
    }
  }
  updateOrder(data,id,context)async{
    CenterDialog.showLoadingDialog(context);
    HttpResult res = await _repository.orderUpdate(data, id);
    if(res.result["success"]){
      await getAllOrder();
      ToastDialog.showSuccessToast(context, "Yangilandi");
      Navigator.pop(context);
      Navigator.pop(context);
    }else{
      Navigator.pop(context);
      ToastDialog.showErrorToast(context, res.result["erroe"]);
    }
  }
  deleteOrder(id,context)async{
    CenterDialog.showLoadingDialog(context);
    HttpResult result = await _repository.orderDelete(id);
    if(result.result["success"]){
      await getAllOrder();
      ToastDialog.showSuccessToast(context, "Yangilandi");
      Navigator.pop(context);
    }else{
      Navigator.pop(context);
      ToastDialog.showErrorToast(context, result.result["erroe"]);
    }
  }
}
final orderBloc = OrderBloc();