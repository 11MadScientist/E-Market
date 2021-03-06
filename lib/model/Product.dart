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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    storeId: json["store_id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    prodName: json["prod_name"],
    prodImg: json["prod_img"],
    prodPrice: json["prod_price"],
    prodUnit: json["prod_unit"],
    prodDesc: json["prod_desc"],
    prodStock: json["prod_stock"],
    prodSales: json["prod_sales"],
    prodAvail: json["prod_avail"],
    prodFavorite: json["prod_favorite"],
    storeName: json["store_name"],
    storeLocation: json["store_location"],
  );

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
    "store_name": storeName,
    "store_location": storeLocation,
  };
}
