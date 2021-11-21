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

class Body extends GetView<CardController> {
   Product? model;

  Body({this.model});
  
  Widget build(BuildContext context) {
    return  GetBuilder<CardController>(
      init: Get.put(CardController()),
      builder: (controller) =>Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                model!.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: model!.name,
                        fontSize: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Size',
                                ),
                               
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  width: 30,
                                  height: 20,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: model!.description,
                        fontSize: 18,
                        height: 2.5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: "PRICE ",
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: ' \$' + model!.price.toString(),
                        color: kPrimaryColor,
                        fontSize: 18,
                      )
                    ],
                  ),
                  GetBuilder<CardController>(
                    init: CardController() ,
                    builder:(controller)=> Container(
                      padding: EdgeInsets.all(20),
                      width: 180,
                      height: 100,
                      child: CustomButton(
                        onPress: controller.addProduct(
                          CardModel(
                            name: model!.name,
                            price: model!.price,
                            image: model!.image,
                            quantity: 1
                            )
                        ),
                        text: 'Add',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
