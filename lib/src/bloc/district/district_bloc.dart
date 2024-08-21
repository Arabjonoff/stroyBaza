import 'package:rxdart/rxdart.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/model/district/discrit_model.dart';
import 'package:stroy_baza/src/model/http_result.dart';

class DistrictBloc{
  final Repository _repository = Repository();
  final _fetchDistrictInfo = PublishSubject<List<DistrictResult>>();
  Stream<List<DistrictResult>> get getDistrictStream => _fetchDistrictInfo.stream;

  getDistrictAll(obj)async{
    List<DistrictResult> regionBase = await _repository.getDistrictBase(obj);
    if(regionBase.isEmpty){
      HttpResult result = await _repository.district();
      if(result.isSuccess){
        var data = DistrictModel.fromJson(result.result);
        for(int i =0; i<data.data.length;i++){
          await _repository.saveDistrictBase(data.data[i]);
        }
        _fetchDistrictInfo.sink.add(data.data);
      }
    }else{
      _fetchDistrictInfo.sink.add(regionBase);
    }
  }
}
final districtBloc = DistrictBloc();