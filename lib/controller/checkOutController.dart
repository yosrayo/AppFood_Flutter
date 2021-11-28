import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/home_screen.dart';

class CheckOutController extends GetxController {
 int get index => _index ;
  int _index = 0;
  Pages get pages =>_pages;
  Pages _pages = Pages.DeliveryTime;

  void changeIndex(int i){
    _index = i ;
    if(_index==1){
      _pages = Pages.AddAddress;
    }else if(_index ==2){
      _pages = Pages.Summary;
    }else if(_index==3){
      Get.to(HomeScreen());

    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return kPrimaryColor;
    } else {
      return todoColor;
    }
  }



}