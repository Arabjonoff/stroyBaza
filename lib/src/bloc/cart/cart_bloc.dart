import 'package:rxdart/rxdart.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/model/order/order_model.dart';

class CartBloc {
  final Repository _repository = Repository();
  final _fetchCartInfo = PublishSubject<List<OrderModel>>();
  Stream<List<OrderModel>> get getCartStream => _fetchCartInfo.stream;
  saveCart(item)async{
    await _repository.saveOrderBase(item);
    await getCartAll();
  }
  getCartAll()async{
    List<OrderModel> data = await _repository.getOrderBase();
    _fetchCartInfo.sink.add(data);
  }
  updateCart(item)async{
    await _repository.updateOrderBase(item);
    await getCartAll();
  }
  delete(id)async{
    await _repository.deleteOrder(id);
    await getCartAll();
  }
  clear()async{
    await _repository.clearOrderBase();
    await getCartAll();
  }
}
final cartBloc = CartBloc();