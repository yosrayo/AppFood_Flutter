
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Product.dart';

import 'package:shop_app/services/homeService.dart';

class HomeController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<Product> get productModel => _productModel;
  List<Product> _productModel = [];

    @override
    onInit(){
      super.onInit();
      print("dddddddddddddddddddddddddddddpppcpcpc");
      HomeViewModel();

    }


  HomeViewModel() {
    getCategory();
    getProducts();

  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      print("value");
      for (int i = 0; i < value.length; i++) {
      
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

   getProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(Product.fromJson(value[i].data()as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      print(_productModel.length);
      update();
    });
  }

 

}