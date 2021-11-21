import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/Auth.dart';
import 'package:shop_app/size_config.dart';

import 'sign_up_form.dart';

class Body extends GetWidget<Auth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.0), // 4%
                Container(
                  margin: const EdgeInsets.all(1),
                  child: Image.asset("assets/images/logo.png"),
                  height: 100,
                  width: 100,
                  //EdgeInsets.only(bottom: 100),
                ),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {controller.googleSignInMethod();},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {controller.facebookSigninMethod();},
                    ),
                   
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
