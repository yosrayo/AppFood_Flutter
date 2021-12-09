
class Order{

  String adresse;
  String longitude;
  String latitude;
  List products;
  String totalPrice;

  Order(
      {required this.adresse,
      required this.longitude,
      required this.latitude,
      required this.products,
        required this.totalPrice,});

  Map<String, dynamic> toMap() {
    return {
      'adresse': this.adresse,
      'longitude': this.longitude,
      'latitude': this.latitude,
      'products': this.products,
      'totalPrice': this.totalPrice,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      adresse: map['adresse'] as String,
      longitude: map['longitude'] as String,
      latitude: map['latitude'] as String,
      products: map['products'] as List,
      totalPrice: map['totalPrice'] as String,
    );
  }
}