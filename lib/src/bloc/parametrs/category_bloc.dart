import 'package:rxdart/rxdart.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/model/parametrs/category_model.dart';

class CategoryBloc{
  final Repository _repository = Repository();
  final _fetchCategoryInfo = PublishSubject<CategoryModel>();
  Stream<CategoryModel> get getCategoryStream => _fetchCategoryInfo.stream;

  getAllCategory()async{
    HttpResult result = await _repository.category();
    if(result.isSuccess){
      var data = CategoryModel.fromJson(result.result);
      _fetchCategoryInfo.sink.add(data);
    }
  }
}
final categoryBloc = CategoryBloc();