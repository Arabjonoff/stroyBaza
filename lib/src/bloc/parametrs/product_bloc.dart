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
      for(int i =0; i<data.data.length;i++){
        for(int j =0; j<data.data[i].productCounts.length;j++){
          data.data[i].img =  data.data[i].productCounts[j].img1;
          data.data[i].wholesalePrice =  data.data[i].wholesalePrice.toString();
          data.data[i].unitPrice =  data.data[i].unitPrice;
          data.data[i].count =  data.data[i].productCounts[j].count;
          data.data[i].size =  data.data[i].productCounts[j].size.name;
        }
        for(int k =0; k<data.data[i].prices.length;k++){
          data.data[i].wholesalePrice = data.data[i].prices[k].wholesalePrice;
          data.data[i].unitPrice = data.data[i].prices[k].unitPrice;
        }
      }
      _fetchProductInfo.sink.add(data);
    }
  }
}
final productBloc = ProductBloc();