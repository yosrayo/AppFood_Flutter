import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/controller/homeController.dart';
import 'package:shop_app/enums.dart';

import 'components/body.dart';

class HomeScreen extends GetView<HomeController> {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
