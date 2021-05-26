import 'package:e_market/model/store.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/utils/network.dart';

class StoreAPIGateway
{
  final EnvEndPoints envEndPoints = EnvEndPoints();

  Store store;

  Future <Store> asyncGet(int acc_id) async
  {
    try{
      Network network = Network(envEndPoints.getEndPoints('/api/storeinfo/$acc_id'));
      dynamic body = await network.getData();
      store = Store.fromJson(body);
      print("sa try");
      print(body);
    }
    catch(e){
      print(e);
      return null;
    }
    return store;
  }

  Future <Store> asyncPost(Map data) async
  {

    try{
      print('babaw sa try');
      Network network = Network(envEndPoints.getEndPoints('/api/storeinfo'));
      print('ubos sa network');
      dynamic body = await network.postData(data);
      print('hi');
      print(body);
      store = Store.fromJson(body);
    }
    catch(e){
      print(e);
      print('dinhi');
    }
      return store;
  }
}