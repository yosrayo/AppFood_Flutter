import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product {
  late String name, image, description, productId;
  late double price;
  late bool isFavourite;
  late String categorie;

  Product(this.productId, this.name, this.image, this.description, this.price, this.categorie,
      this.isFavourite);

  Product.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    price = map['price'];
    isFavourite = map['isFavourite'];
    categorie = map['categorie'];
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'isFavourite': isFavourite,
       'categorie': categorie
    };
  }
}
