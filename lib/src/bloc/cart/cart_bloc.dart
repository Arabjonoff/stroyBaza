import 'package:rxdart/rxdart.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/model/order/order_model.dart';

class CartBloc {
  final Repository _repository = Repository();
  final _fetchCartInfo = PublishSubject<List<OrderModel>>();
  Stream<List<OrderModel>> get getCartStream => _fetchCartInfo.stream;

  getCartAll()async{
    List<OrderModel> data = await _repository.getOrderBase();
    _fetchCartInfo.sink.add(data);
  }
}
final cartBloc = CartBloc();