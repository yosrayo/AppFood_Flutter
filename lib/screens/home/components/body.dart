import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/categories.dart';

import '../../../size_config.dart';

import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            
            SizedBox(height: getProportionateScreenWidth(10)),
            Categories(),
           // SpecialOffers(),
           // SizedBox(height: getProportionateScreenWidth(30)),
            //PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
