// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart> cartFromJson(String str) => List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  Cart({
    this.id,
    this.accId,
    this.storeId,
    this.prodId,
    this.prodQty,
    this.total,
  });

  int id;
  int accId;
  int storeId;
  int prodId;
  int prodQty;
  double total;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    accId: json["acc_id"],
    storeId: json["store_id"],
    prodId: json["prod_id"],
    prodQty: json["prod_qty"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "acc_id": accId,
    "store_id": storeId,
    "prod_id": prodId,
    "prod_qty": prodQty,
    "total":total,
  };
}
