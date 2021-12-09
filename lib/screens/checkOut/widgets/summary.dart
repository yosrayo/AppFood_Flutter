import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/CardController.dart';
import 'package:shop_app/controller/checkOutController.dart';
import 'package:shop_app/models/order.dart';


class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final arguments =  Get.arguments;
    return  Scaffold(
        body:
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: GetBuilder<CardController>(
                  builder:(controller)=>
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 350,
                        padding: EdgeInsets.all(30.0),
                        child: ListView.separated
                          (
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.cardPoduct.length,
                            itemBuilder: (context,index)=>
                                Container(

                                  child: Column(

                                    children: [

                                      Container(
                                        height: 150,
                                          width: 140,
                                          child: Image.network(controller.cardPoduct[index].image,
                                          fit: BoxFit.fill,),
                                      ),
                                      SizedBox(height: 10,),
                                      Text("${controller.cardPoduct[index].name}"),
                                      SizedBox(height: 10,),
                                      Text("${controller.cardPoduct[index].price} x ${controller.cardPoduct[index].quantity}"),
                                      SizedBox(height: 20,),




                                    ],
                                  ),


                                ),



                                    separatorBuilder: (context,index){
                                    return SizedBox(width: 10.0,);
                          }
                          ),
                      ),
                      GetBuilder<CheckoutController>(
                        init: Get.put(CheckoutController()),
                        builder:(ctrl) =>Column(
                          mainAxisAlignment:  MainAxisAlignment.start,

                          children: [
                            Text("Your adresse is ", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),),
                            Row(

                              children: [
                                Text("${ctrl.adresse}")

                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("Your Phone Number is ", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),),
                            Row(

                              children: [
                                // Text("${ctrl.phoneNumberGetter()!.toLowerCase()}", style: TextStyle(
                                //   letterSpacing: 2.0,
                                // ),),


                              ],
                            ),
                            ElevatedButton(onPressed: (){
                              List yourItemList = [];
                              for (int i = 0; i < controller.cardPoduct.length; i++)
                                yourItemList.add({
                                  "name": controller.cardPoduct[i].name,
                                  "quantity": controller.cardPoduct[i].quantity,
                                  "image": controller.cardPoduct[i].image,
                                });


                              Order order = new Order(adresse: ctrl.adresse, longitude: ctrl.longitude, latitude: ctrl.latitude, products: yourItemList, totalPrice: controller.totalPrice.toString());
                              ctrl.addOrder(order);


                            }, child: Text('Submit'))

                          ],
                        ),
                      ),

                    ],


                  ),
                ),
              ),
            ),





    );
  }
}
