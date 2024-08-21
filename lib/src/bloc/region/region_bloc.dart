import 'package:rxdart/rxdart.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/model/http_result.dart';
import 'package:stroy_baza/src/model/region/region_model.dart';

class RegionBloc{
  final Repository _repository = Repository();
  final _fetchRegionInfo = PublishSubject<List<RegionResult>>();
  Stream<List<RegionResult>> get getRegionStream => _fetchRegionInfo.stream;

  getRegionAll()async{
    List<RegionResult> regionBase = await _repository.getRegionBase();
    if(regionBase.isEmpty){
      HttpResult result = await _repository.region();
      if(result.isSuccess){
        var data = RegionModel.fromJson(result.result);
        for(int i =0; i<data.data.length;i++){
          await _repository.saveRegionBase(data.data[i]);
        }
        _fetchRegionInfo.sink.add(data.data);
      }
    }else{
      _fetchRegionInfo.sink.add(regionBase);
    }
  }
}
final regionBloc = RegionBloc();