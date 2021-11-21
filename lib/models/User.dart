class UserModel {
  late String? userId, email, firstname, lastname, pic  ;
 // late int? phone ;

  UserModel(String uid, String e, String f, String l, String p,  {
    this.userId ,
   this.email 
  , this.firstname, 
  this.lastname,
   this.pic,
  

   });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    firstname = map['firstname'];
    lastname = map['firstname'];
    pic = map['pic'];
    //phone = map['phone'];
    //address = map['address'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'pic': pic,
     // 'phone': phone,
      //'address': address,

    };
  }
}