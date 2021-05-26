import 'package:e_market/model/Order.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/utils/network.dart';

class OrderAPIGateway
{
  final EnvEndPoints envEndPoints = EnvEndPoints();
  Order order;

  Future<List<Order>> asyncListGetUser(int transaction_id) async
  {
    List<Order> orders;
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/userorder/$transaction_id'));
      orders = orderFromJson(await network.getListData());
    }
    catch (e)
    {
      print("order_api_gateway error: $e");
      return null;
    }
    return orders;
  }

  Future<List<Order>> asyncListGetSeller(int store_id) async
  {
    List<Order> orders;
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/sellerorder/$store_id'));
      orders = orderFromJson(await network.getListData());
    }
    catch (e)
    {
      print("order_api_gateway error: $e");
      return null;
    }
    return orders;
  }

  Future<Order> asyncPost(Map data) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/order'));
      dynamic body = await network.postData(data);
      // print(body);
      // order = Order.fromJson(body["data"]);
    }
    catch(e)
    {
      print("cart_api_gateway: $e");
    }
    // return order;
  }

  Future<Order> asyncPut(Map data) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/order'));
      dynamic body = await network.putData(data);
      // print(body);
      // order = Order.fromJson(body["data"]);
    }
    catch(e)
    {
      print("cart_api_gateway: $e");
    }
    // return order;
  }
  // Future<Order> asyncPut(Map data) async
  // {
  //   try
  //   {
  //     Network network = Network(envEndPoints.getEndPoints('/api/order'));
  //     dynamic body = await network.putData(data);
  //     order = Order.fromJson(body);
  //   }
  //   catch(e)
  //   {
  //     print("order_api_gatewayput: $e");
  //   }
  //   return order;
  // }

  // Future<Order> asyncDelete(int id)async
  // {
  //   try
  //   {
  //     Network network = Network(envEndPoints.getEndPoints('/api/cart/$id'));
  //     dynamic body =await network.deleteData();
  //     order = Order.fromJson(body);
  //
  //   }
  //   catch(e)
  //   {
  //     print("asyncDeldete:$e");
  //   }
  //   return order;
  // }
}

