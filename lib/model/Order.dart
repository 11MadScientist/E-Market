// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.id,
    this.accId,
    this.storeId,
    this.prodId,
    this.quantity,
    this.prodPrice,
    this.transactionId,
    this.total,
    this.orderStatus,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int accId;
  int storeId;
  int prodId;
  int quantity;
  double prodPrice;
  int transactionId;
  double total;
  String orderStatus;
  dynamic createdAt;
  dynamic updatedAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    accId: json["acc_id"],
    storeId: json["store_id"],
    prodId: json["prod_id"],
    quantity: json["quantity"],
    prodPrice: json["prod_price"],
    transactionId: json["transaction_id"],
    total: json["total"],
    orderStatus: json["order_status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "acc_id": accId,
    "store_id": storeId,
    "prod_id": prodId,
    "quantity": quantity,
    "prod_price": prodPrice,
    "transaction_id": transactionId,
    "total": total,
    "order_status": orderStatus,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
