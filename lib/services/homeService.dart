import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('categorie');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('products');
       final CollectionReference _popularCollectionRef =
      FirebaseFirestore.instance.collection('popular');


  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzz${value.docs}");

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productCollectionRef.get();
    print("fffffffffffffffffffff${value.docs}");
    return value.docs;
  }

   Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _popularCollectionRef.get();
    print("hhhhhhhhhhhhhhhhhhhhh${value.docs}");
    return value.docs;
  }
}
