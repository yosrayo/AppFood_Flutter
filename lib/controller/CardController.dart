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

  var cardProduct = [].obs;
   get cardPoduct => cardProduct.value;
  CardController() {
    getAllProduct();
   
  }

  addProduct(CardModel cardModel) async {
    var dbHelper = CardDataBaseHelper.db;
    await dbHelper.insert(cardModel);
    update();
  }

  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CardDataBaseHelper.db;
    cardProduct.value = await dbHelper.getAll();
    print("fffffffffffffffhsjsjs${cardProduct.length}");

  

    _loading.value = false;
  }
}
