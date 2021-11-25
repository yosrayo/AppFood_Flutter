import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';


class AppDrawer extends StatelessWidget {
 static String routeName = "/drawer";
  Widget _createDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: () {
       // print("dddddddddddddddddddddddddddddddddddddddd${updatePageController.currentPage.value}");
        onTap!();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.home, text: 'detail_vente_jour'.tr,onTap: ()=>Get.to(SignInScreen())),
          _createDrawerItem(icon: Icons.insert_chart, text: 'statistique'.tr,onTap: ()=>Get.to(SignInScreen())),
          _createDrawerItem(icon: Icons.note, text: 'rapport'.tr,onTap: ()=>Get.to(SignInScreen())),
          _createDrawerItem(icon: Icons.note, text: 'apropos'.tr,onTap: ()=>Get.to(()=> SignInScreen())),

          Padding(
            padding:  EdgeInsets.only(bottom: 36.0, left: 12.0, right: 12),
           // child:SetLangDropdownButton(localizationController,style,Colors.grey[200],Colors.black),
          ),
          //Spacer(),
          TextButton(
            onPressed: ()  {
            //  showStartDialog(context);
            },
            style: TextButton.styleFrom(
              // primary: selected! ? Color(0x44000000) : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 24,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text("deconnexion".tr,
                   // style: style,

                  ),
                )
              ],
            ),
          ),
         

        ],
      ),
    );
  }
  }

  Widget _createHeader() {

    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.orange
            ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          SizedBox(height: 11,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(radius: 40.0,
              backgroundImage: AssetImage("images/app-resto-icon.PNG",),
            ),
          ),
              SizedBox(height: 11,),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text("hhhhhhh",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ]));
  }