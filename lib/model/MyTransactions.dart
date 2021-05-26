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
    this.grandTotal,
    this.paymentMode,
    this.transactionStatus,
    this.updatedAt,
    this.createdAt,
  });

  int id;
  int accId;
  double grandTotal;
  String paymentMode;
  String transactionStatus;
  DateTime updatedAt;
  DateTime createdAt;

  factory MyTransactions.fromJson(Map<String, dynamic> json) => MyTransactions(
    id: json["id"] as int,
    accId: json["acc_id"] as int,
    grandTotal: json["grand_total"] as double,
    paymentMode: json["payment_mode"],
    transactionStatus: json["transaction_status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "acc_id": accId,
    "grand_total": grandTotal,
    "payment_mode": paymentMode,
    "transaction_status": transactionStatus,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}
