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
      id             : json['id'],
      acc_id         : json['acc_id'],
      store_name     : json['store_name'],
      store_location : json['store_location'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id"             : id,
    "acc_id"         : acc_id,
    "store_name"     : store_name,
    "store_location" : store_location,
  };

}