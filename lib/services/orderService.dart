import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/models/order.dart';

class OrderService {
  final CollectionReference _orderCollectionRef =
      FirebaseFirestore.instance.collection('order');
     addOrder(Order order)async{

    await _orderCollectionRef.add({
      'adresse': order.adresse,
      'latitude': order.latitude,
      'longitude':order.longitude,
      'totalprice':order.totalPrice,

      'products': FieldValue.arrayUnion(order.products),


    });
    print('ok added successfully');
  }

 
}