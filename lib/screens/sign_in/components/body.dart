import 'package:flutter/material.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/controller/Auth.dart';
import '../../../size_config.dart';
import 'sign_form.dart';
import 'package:get/get.dart';

class Body extends GetWidget<Auth> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20) ,),
              //EdgeInsets.only(bottom: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.0 , ),
                Container(
                  margin: const EdgeInsets.all(1),
                  child: Image.asset("assets/images/logo.png"),
                  height: 100,
                  width: 100,
                  //EdgeInsets.only(bottom: 100),
                ),
                Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        controller.googleSignInMethod();
                      },
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {
                        controller.facebookSigninMethod();
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
