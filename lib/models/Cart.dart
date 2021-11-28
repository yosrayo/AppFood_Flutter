// ignore: file_names
import 'dart:ffi';
import 'package:flutter/material.dart';

class CardModel {
  late String name, image, productId;
  late int quantity;
  late double price;

  CardModel(
      {this.productId = "",
      this.name = "",
      this.image = "",
      this.quantity = 1,
      required this.price});

  CardModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
