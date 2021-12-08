import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/colors.dart';
import 'package:shop_app/components/custom_buttom.dart';
import 'package:shop_app/components/custom_text.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/CardController.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/style.dart';

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
      builder: (controller) => Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          onPressed: ()  {
                            
                          
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryText(
                text: 'Place an Order',
                fontWeight: FontWeight.w600,
                size: 18,
              ),
              Icon(Icons.chevron_right)
            ],
          ),
          style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          customAppBar(context),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: 'Primavera \nPizza',
                  size: 45,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/dollar.svg',
                      color: AppColors.tertiary,
                      width: 15,
                    ),
                    PrimaryText(
                      text: '5.99',
                      size: 48,
                      fontWeight: FontWeight.w700,
                      color: AppColors.tertiary,
                      height: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              text: 'Size',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: 'Medium 14"',
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: 20,
                            ),
                            PrimaryText(
                              text: 'Crust',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: 'Thin Crust',
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: 20,
                            ),
                            PrimaryText(
                              text: 'Delivery in',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: '30 min', fontWeight: FontWeight.w600),
                          ]),
                    ),
                    Hero(
                      tag: model!.image,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 30),],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 200,
                        child:
                            Image.network(model!.image, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                PrimaryText(
                    text: 'Ingredients', fontWeight: FontWeight.w700, size: 22),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
       
         
        ],
       ) ),
    );
  }

  Container ingredientCard(String imagePath) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.only(
          right: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.grey),
            ]),
        child: Image.asset(
          imagePath,
          width: 90,
        ));
  }

 AppBar customAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Product",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}