// To parse this JSON data, do
//
//     final myTransactions = myTransactionsFromJson(jsonString);

import 'dart:convert';

List<MyTransactions> myTransactionsFromJson(String str) => List<MyTransactions>.from(json.decode(str).map((x) => MyTransactions.fromJson(x)));

String myTransactionsToJson(List<MyTransactions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyTransactions {
  MyTransactions({
    this.id,
    this.accId,
    this.storeId,
    this.prodId,
    this.prodQty,
    this.transactionStatus,
  });

  int id;
  int accId;
  int storeId;
  int prodId;
  int prodQty;
  String transactionStatus;

  factory MyTransactions.fromJson(Map<String, dynamic> json) => MyTransactions(
    id: json["id"],
    accId: json["acc_id"],
    storeId: json["store_id"],
    prodId: json["prod_id"],
    prodQty: json["prod_qty"],
    transactionStatus: json["transaction_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "acc_id": accId,
    "store_id": storeId,
    "prod_id": prodId,
    "prod_qty": prodQty,
    "transaction_status": transactionStatus,
  };
}
