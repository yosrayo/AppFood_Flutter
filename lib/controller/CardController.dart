import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/services/fireStore_Card.dart';

class CardController extends GetxController {
  //TODO: Implement CardController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // ignore: unnecessary_statements
    getAllProduct();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var cardProduct = [].obs;
  get cardPoduct => cardProduct;
  CardController() {
    getAllProduct();
    getTotalPrice();
  }


   addProduct(CardModel model) async{
    if(cardProduct.length==0){
      var dbHelper = CardDataBaseHelper.db;
      await dbHelper.insert(model);
      getAllProduct();
    }else{
      for (int i=0; i<cardProduct.length;i++){
        if(cardProduct[i].productId==model.productId){
          return;
        }
      }
      var dbHelper = CardDataBaseHelper.db;
      await dbHelper.insert(model);
      getAllProduct();
    }

    update();

  }

 getTotalPrice() {
    _totalPrice =0;
    for (int i = 0; i < cardProduct.length; i++) {
      _totalPrice += (cardProduct[i].price *
          cardProduct[i].quantity);
      print(_totalPrice);
    }
    update();

  }


  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CardDataBaseHelper.db;
    cardProduct.value = await dbHelper.getAll();
    print("fffffffffffffffhsjsjs${cardProduct.length}");

    _loading.value = false;
    getTotalPrice();
    update();
  }


   InscreaseQuantity(int index) async {
     var dbHelper = CardDataBaseHelper.db;
    cardProduct[index].quantity ++;
    _totalPrice += ((double.parse(cardProduct[index].price)));
    await dbHelper.updateProduct(cardProduct[index]);

    update();
  }


  DecreaseQuantity(int index)async {
      var dbHelper = CardDataBaseHelper.db;
       if(cardProduct[index].quantity<=1){
         print(cardProduct[index].quantity);
           return;
        }else{
         cardProduct[index].quantity --;
    }

    _totalPrice -= ((double.parse(cardProduct[index].price)));
   
    await dbHelper.updateProduct(cardProduct[index]);
          update();
  }


    deletelement(int index)async{
        var dbHelper = CardDataBaseHelper.db;
     await dbHelper.deleteProduct(cardProduct[index]);
    update();

  }

}
