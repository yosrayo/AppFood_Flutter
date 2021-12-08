import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Popular {
  late String name, image, description, productId;
  late double price;
  late bool isFavourite;
  late String categorie;

  Popular(this.productId, this.name, this.image, this.description, this.price, this.categorie,
      this.isFavourite);

  Popular.fromJson(Map<dynamic, dynamic> map) {
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
