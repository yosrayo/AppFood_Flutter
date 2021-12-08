import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/User.dart';

class LocalStorageData extends GetxController {


  @override
  onInit(){
    super.onInit();
    getUserData();
  }

Future <UserModel?>get getUser async{
  try{
  UserModel userModel = await getUserData();
  if(userModel== null){
    return null;
  }
return userModel;

  }catch(e){
    print(e.toString());
    return null ;
  }
}

getUserData()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var value= prefs.getString('user');
  print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$value");
  return UserModel.fromJson(json.decode(value!));
}

setUser(UserModel userModel) async{
SharedPreferences prefs = await SharedPreferences.getInstance();

await prefs.setString('user', json.encode(userModel.toJson()));
}

void deleteUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();

}

}