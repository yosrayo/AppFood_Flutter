// ignore: file_names
import 'dart:ffi';
import 'package:flutter/material.dart';

class CardModel {
 late  String name, image;
 late  int  quantity;
 late double price;
  

  CardModel({
      this.name="",
      this.image="",
      this.quantity=1,
      required this.price });

  CardModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}