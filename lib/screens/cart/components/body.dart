import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/CardController.dart';
import 'package:shop_app/controller/homeController.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
     CardController controller = Get.put(CardController());
     
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Obx(()=>  ListView.builder(
        itemCount: controller.cardPoduct.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(controller.cardProduct[index].name),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
               controller.cardProduct[index].removeAt(index);
              });
            },
            background: Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                 Icon(Icons.delete,size: 40,)
                ],
              ),
            ),
            child: ListTile(
              title:  Text( controller.cardPoduct[index].name,style: TextStyle(fontSize: 18),),
              subtitle:  Text( controller.cardPoduct[index].price.toString(),style: TextStyle(fontSize: 15),),
              leading:Image.network(controller.cardPoduct[index].image,height: 50,) ,
              trailing: Container(
                width: 110,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon : Icon(Icons.exposure_minus_1)
                    ),
                    Text( controller.cardPoduct[index].quantity.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                    IconButton(
                      onPressed: null,
                      icon : Icon(Icons.plus_one_outlined)
                    ),
                  ],
                ),
              ),
            )
            
            
          ),
        ),
      ),
    ));
  }
}
