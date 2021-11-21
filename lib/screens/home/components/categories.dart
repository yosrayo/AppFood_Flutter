import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/custom_text.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/homeController.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../../size_config.dart';

class Categories extends GetView<HomeController> {

  @override
  
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => Column(
        children: [
          Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: _searchTextFormField()),
          SizedBox(height: 15,),
          Container(
            height: 100,
            child: ListView.separated(
              itemCount: controller.categoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            controller.categoryModel[index].image),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.categoryModel[index].name,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: Get.height * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: _listViewProducts(),
            ),
          ),
        ],
      ),
    );
  }


  
Widget _listViewProducts() {
  return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => GridView.builder(
        
        
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => GestureDetector(
              //width: MediaQuery.of(context).size.width * .4,
              onTap: () {
                print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${controller.productModel[index].price}");
               Get.to(()=>DetailsScreen(  product: controller.productModel[index]));
              },
              child:
              
                  Column(
                    children: [
                      Container(
                        

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    
                      color: Colors.grey.shade100,
                    ),
                    width: 150,
                    child: Container(
                        height: 100,
                        child: Image.network(
                          controller.productModel[index].image,
                          fit: BoxFit.fill,
                          
                        )
                        ),
                        
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: controller.productModel[index].name,
                    alignment: Alignment.bottomCenter,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: CustomText(
                      text: controller.productModel[index].description,
                      color: Colors.grey,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  CustomText(
                    text:
                        controller.productModel[index].price.toString() + " \$",
                    color: kPrimaryColor,
                    alignment: Alignment.bottomCenter,
                  ),   SizedBox(
                    height: 10,
                  ),
                    ],

                  ),
                  
                
              
            ),
            itemCount: controller.productModel.length,
          ));
}

 Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}
