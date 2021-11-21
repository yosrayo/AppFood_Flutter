import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.0),
                Container(
                  margin: const EdgeInsets.all(1),
                  child: Image.asset("assets/images/logo.png"),
                  height: 100,
                  width: 100,
                  //EdgeInsets.only(bottom: 100),
                ),
                Text("Complete Profile", style: headingStyle),
               
                SizedBox(height: SizeConfig.screenHeight * 0.0),
                CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
