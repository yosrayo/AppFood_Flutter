import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/controller/homeController.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find(),
      builder: (controller) => Container(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(title: "Popular Products", press: () {}),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                   controller.productModel.length,
                    (index) {
                      if (controller.productModel[index].isFavourite)
                        return ProductCard(product: controller.productModel[index]);
    
                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
