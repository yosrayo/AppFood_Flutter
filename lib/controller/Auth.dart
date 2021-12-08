// ignore_for_file: dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/helper/localStorage_data.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/services/firestoreUser.dart';

class Auth extends GetxController {
  final LocalStorageData localStorageData = Get.find();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, firstname, lastname, address;
  late int phone;
  final count = 0.obs;
  get List => list;
   var list = [].obs;
  
    String get fLname => _fLname;
  String _fLname = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void facebookSigninMethod() async {
    var fbLogin = FacebookLogin();

    var result = await fbLogin.logIn(['email', 'public_profile']);
    print("cccccccccccccccccccccccccccccccccc${result.errorMessage}");

    if (result.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken myToken = result.accessToken;
      AuthCredential credential =
          FacebookAuthProvider.credential(myToken.token);
      var user = await FirebaseAuth.instance.signInWithCredential(credential);
      Get.to(HomeScreen());
    }
  }

  void googleSignInMethod() async {
   // SharedPreferences prefs = await SharedPreferences.getInstance();

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential);
    
         localStorageData.setUser(UserModel(googleUser.id ,googleUser.email,googleUser.displayName.toString().split(" ")[0],googleUser.displayName.toString().split(" ")[1],googleUser.photoUrl.toString()));
           print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${localStorageData.getUserData()}");
       // list=  localStorageData.getUserData();
        //print("tttttttttttttttttttttttt${list}");
        
     Get.to(HomeScreen());
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          setUser(UserModel.fromJson(value.data() as Map<dynamic,dynamic> ));
        });
      });
      Get.to(HomeScreen());
    } catch (e) {
      print(e);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
        user.user!.uid,
      user.user!.email!,
      firstname == null ? user.user!.displayName! : firstname,
      lastname == null ? user.user!.displayName! : lastname,
      '',
        ));
      });

      Get.offAll(SignInScreen());
    } catch (e) {
      Get.snackbar(
        'Error login account',
        "e.message",
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {

   UserModel userModel=  UserModel(
      user.user!.uid,
      user.user!.email!,
      firstname == null ? user.user!.displayName! : firstname,
      lastname == null ? user.user!.displayName! : lastname,
      '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
    print(userModel);
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
    Get.offAll(SignInScreen());
  }

  Future<void> sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }
}
