import 'package:e_market/model/Cart.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/utils/network.dart';

class CartAPIGateway
{
  final EnvEndPoints envEndPoints = EnvEndPoints();
  Cart cart;

  Future<List<Cart>> asyncListGet(int acc_id) async
  {
    List<Cart> carts;
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/cart/$acc_id'));
      carts = cartFromJson(await network.getListData());
    }
    catch (e)
    {
      print("api_gateway error: $e");
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
      print("cart_api_gateway: $e");
    }
    return cart;
  }
  Future<Cart> asyncPut(Map data) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/cart'));
      dynamic body = await network.putData(data);
      cart = Cart.fromJson(body);
    }
    catch(e)
    {
      print("cart_api_gatewayput: $e");
    }
    return cart;
  }

  Future<dynamic> asyncDelete(int id)async
  {
    try
        {
          Network network = Network(envEndPoints.getEndPoints('/api/cart/$id'));
          dynamic body =await network.deleteData();
          return body;

        }
        catch(e)
    {
      print("asyncDeldete:$e");
    }

  }
}

