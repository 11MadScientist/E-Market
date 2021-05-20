import 'package:e_market/model/MyTransactions.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/utils/network.dart';

class CartAPIGateway
{
  final EnvEndPoints envEndPoints = EnvEndPoints();
  MyTransactions _transactions;

  Future<List<MyTransactions>> asyncListGet() async
  {
    List<MyTransactions> carts;
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/mytransactions'));
      carts = myTransactionsFromJson(await network.getListData());
      print(carts);
    }
    catch (e)
    {
      print(e);
      return null;
    }
    return carts;
  }

  Future<MyTransactions> asyncPost(Map data) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/cart'));
      dynamic body = await network.postData(data);
      _transactions = MyTransactions.fromJson(body);
    }
    catch(e)
    {
      print(e);
    }
    return _transactions;
  }
}

