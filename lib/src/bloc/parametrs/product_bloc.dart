import 'package:rxdart/rxdart.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/model/parametrs/product_model.dart';

class ProductBloc{
  final Repository _repository = Repository();
  final _fetchProductInfo = PublishSubject<ProductModel>();
  Stream<ProductModel> get getProductStream => _fetchProductInfo.stream;

  getProductAll(int id)async{
    HttpResult result = await _repository.productList(id);
    if(result.isSuccess){
      var data = ProductModel.fromJson(result.result);
      _fetchProductInfo.sink.add(data);
    }
  }
}
final productBloc = ProductBloc();