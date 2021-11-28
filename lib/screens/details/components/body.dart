import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/custom_buttom.dart';
import 'package:shop_app/components/custom_text.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/CardController.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
   Product? model;

  Body({this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardController>(
      init: Get.put(CardController()),
      builder: (controller) => ListView(
        children: [
          (Image.network(
                    model!.image,
                    fit: BoxFit.fill,
          )),
          Column(
            children: [
             
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                   // ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                             controller.addProduct(
                              CardModel(
                                productId: model!.productId,
                                name: model!.name,
                                price: model!.price,
                                image: model!.image,
                                quantity: 1
                                )
                            );
                            
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}