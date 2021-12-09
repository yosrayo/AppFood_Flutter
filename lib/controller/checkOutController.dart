
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/order.dart';

class CheckoutController extends GetxController{

  String _adresse= 'oss';
  String get adresse => _adresse;

  set adresse(String value) {
    _adresse = value;
  }
  String _longitude ='';

  String get longitude => _longitude;
  String _latitude ='';

  String get latitude => _latitude;

  set latitude(String latitude) {
    _latitude = latitude;
  }

  set longitude(String longitude) {
    _longitude = longitude;
  }
  
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