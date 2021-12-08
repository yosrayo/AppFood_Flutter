import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/colors.dart';
import 'package:shop_app/controller/homeController.dart';
import 'package:shop_app/screens/details/details_screen.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
             title: Column(
        children: [
          Text(
            "Product",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),


          ),
      backgroundColor: Color(0xFFFCFAF8),
      body: GetBuilder<HomeController>(
        init: Get.put(HomeController()),
        builder: (controller) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: controller.productModel.length,
              
              itemBuilder: (context, index)=>GestureDetector (
                 
                  child:
                        
                        _buildCard(controller.productModel[index].name,
                         controller.productModel[index].price.toString(), 
                         controller.productModel[index].image,
                            false, false, context),
                       
                    
                )
              ),
      ),
            
           
         
      
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 9.0, right: 0.0),
        child: InkWell(
            onTap: () {
              // Get.to(() =>
                     // DetailsScreen(product: controller.productModel[index]));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite, color: Color(0xFFFFC61F))
                                : Icon(Icons.favorite_border,
                                    color: Color(0xFFFFC61F))
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(price,
                      style: TextStyle(
                          color: Color(0xFFFFC61F),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Colors.black, height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFFFC61F), size: 12.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFFFC61F),
                                      fontSize: 12.0))
                           
                            
                        
                            
                          ]))
                ]))));
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
