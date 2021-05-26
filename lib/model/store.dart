import 'package:flutter/cupertino.dart';

class Store
{
  final int id;
  final int acc_id;
  final String store_name;
  final String store_location;

  Store({
    @required this.id,
    @required this.acc_id,
    @required this.store_name,
    @required this.store_location,
  });

  factory Store.fromJson(Map<String, dynamic> json)
  {
    return Store(
      id             : json['data']['id'] as int,
      acc_id         : json['data']['acc_id'] as int,
      store_name     : json['data']['store_name'] as String,
      store_location : json['data']['store_location'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    "id"             : id,
    "acc_id"         : acc_id,
    "store_name"     : store_name,
    "store_location" : store_location,
  };

}