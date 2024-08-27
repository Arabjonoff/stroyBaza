import 'package:rxdart/rxdart.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/model/order/order_list_model.dart';

class OrderBloc{
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
}
final orderBloc = OrderBloc();