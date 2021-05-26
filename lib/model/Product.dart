// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.storeId,
    this.categoryId,
    this.categoryName,
    this.prodName,
    this.prodImg,
    this.prodPrice,
    this.prodUnit,
    this.prodDesc,
    this.prodStock,
    this.prodSales,
    this.prodAvail,
    this.prodFavorite,
    this.storeName,
    this.storeLocation,
  });

  int id;
  int storeId;
  int categoryId;
  String categoryName;
  String prodName;
  String prodImg;
  double prodPrice;
  String prodUnit;
  String prodDesc;
  String prodStock;
  int prodSales;
  int prodAvail;
  int prodFavorite;
  String storeName;
  String storeLocation;

  factory Product.fromJson(Map<String, dynamic> json)
  {
    return Product(
    id: json["id"] as int,
    storeId: json["store_id"] as int,
    categoryId: json["category_id"] as int,
    categoryName: json["category_name"] as String,
    prodName: json["prod_name"] as String,
    prodImg: json["prod_img"] as String,
    prodPrice: json["prod_price"] as double,
    prodUnit: json["prod_unit"] as String,
    prodDesc: json["prod_desc"] as String,
    prodStock: json["prod_stock"] as String,
    prodSales: json["prod_sales"] as int,
    prodAvail: json["prod_avail"] as int,
    prodFavorite: json["prod_favorite"] as int,
  );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "category_id": categoryId,
    "category_name": categoryName,
    "prod_name": prodName,
    "prod_img": prodImg,
    "prod_price": prodPrice,
    "prod_unit": prodUnit,
    "prod_desc": prodDesc,
    "prod_stock": prodStock,
    "prod_sales": prodSales,
    "prod_avail": prodAvail,
    "prod_favorite": prodFavorite,
  };
}
