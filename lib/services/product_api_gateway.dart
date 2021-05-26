import 'package:e_market/model/Product.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/utils/network.dart';

class ProductAPIGateway
{
  final EnvEndPoints envEndPoints = EnvEndPoints();
  Product product;

  Future<Product> asyncGet(int id) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/products/$id'));
      dynamic body = await network.getData();
      product = Product.fromJson(body[0]);
    }
    catch (e)
    {
      return null;
    }
    return product;
  }

  Future<List<Product>> asyncListGet() async
  {
    List<Product> products;
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/products'));
      products = productFromJson(await network.getListData());
    }
    catch (e)
    {
      print(e);
      return null;
    }
    return products;
  }

  Future<Product> asyncPost(Map data) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/products'));
      dynamic body = await network.postData(data);
      product = Product.fromJson(body);
    }
    catch(e)
    {
      print(e);
    }
    return product;
  }
}

