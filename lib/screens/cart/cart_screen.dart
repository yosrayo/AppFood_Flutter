import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/homeController.dart';
import 'package:shop_app/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(
      init: Get.find(),
      builder: (controller) => Container(
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Body(),
          bottomNavigationBar: CheckoutCard(),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${controller.productModel.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
