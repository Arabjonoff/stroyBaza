import 'package:rxdart/rxdart.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/model/client/client_model.dart';
import 'package:stroy_baza/src/model/http_result.dart';

class ClientBloc{
  final Repository _repository = Repository();
  final _fetchClientInfo = PublishSubject<List<ClientResult>>();
  Stream<List<ClientResult>> get getClientStream => _fetchClientInfo.stream;

  getAllClient(obj)async{
    List<ClientResult> clientBase = await _repository.getClientBase(obj);
    if(clientBase.isEmpty){
      HttpResult result = await _repository.clientList();
      if(result.isSuccess){
        var data = ClientModel.fromJson(result.result);
        for(int i =0;i<data.data.length;i++){
          await _repository.saveClient(data.data[i]);
        }
        _fetchClientInfo.sink.add(data.data);
      }
    }else{
      _fetchClientInfo.sink.add(clientBase);
    }
  }
  clear()async{
    await _repository.clearClientBase();
    getAllClient("");
  }
}
final clientBloc = ClientBloc();