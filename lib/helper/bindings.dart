
import 'package:get/get.dart';
import 'package:shop_app/controller/Auth.dart';
import 'package:shop_app/controller/CardController.dart';
import 'package:shop_app/controller/checkOutController.dart';
import 'package:shop_app/controller/homeController.dart';
import 'package:shop_app/helper/localStorage_data.dart';



class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Auth());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CardController());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutController());
    
  }
}