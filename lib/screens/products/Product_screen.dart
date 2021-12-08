import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/CardController.dart';
import 'package:shop_app/controller/homeController.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/products/AllProduct.dart';



class ProductScreen extends StatelessWidget {
  //static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(
      init: Get.find(),
      builder: (controller) => Container(
        child: Scaffold(
          appBar: buildAppBar(context),
          body: AllProducts(),
         
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    CardController controller = Get.put(CardController());
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          
        ],
      ),
    );
  }
}
