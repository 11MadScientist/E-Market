import 'package:e_market/model/Cart.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/utils/network.dart';

class CartAPIGateway
{
  final EnvEndPoints envEndPoints = EnvEndPoints();
  Cart cart;

  Future<List<Cart>> asyncListGet() async
  {
    List<Cart> carts;
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/cart'));
      carts = cartFromJson(await network.getListData());
      print(carts);
    }
    catch (e)
    {
      print(e);
      return null;
    }
    return carts;
  }

  Future<Cart> asyncPost(Map data) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/cart'));
      dynamic body = await network.postData(data);
      cart = Cart.fromJson(body);
    }
    catch(e)
    {
      print(e);
    }
    return cart;
  }
}

