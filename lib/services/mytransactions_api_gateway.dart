import 'dart:convert';

import 'package:e_market/model/MyTransactions.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/utils/network.dart';

class MyTransactionsAPIGateway
{
  final EnvEndPoints envEndPoints = EnvEndPoints();
  MyTransactions _transaction;

  Future<List<MyTransactions>> asyncListGet(int acc_id) async
  {
    List<MyTransactions> transactions;
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/mytransactions/$acc_id'));
      transactions = myTransactionsFromJson(await network.getListData());
      print(transactions);
    }
    catch (e)
    {
      print(e);
      return null;
    }
    return transactions;
  }

  Future<dynamic> asyncPost(Map data) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/mytransactions'));
      dynamic body = await network.postData(data);
      return body["data"];
      // print("body ${body["data"]}");
      // _transaction = MyTransactions.fromJson(body["data"]);
    }
    catch(e)
    {
      print("mytransactions: $e");
    }

  }
}

