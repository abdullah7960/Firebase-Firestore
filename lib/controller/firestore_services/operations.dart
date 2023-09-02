import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(String productName, String productPrice,
    String imageUrl, bool isFavourite) async {
  await FirebaseFirestore.instance.collection("prince335055").add({
    'productName': productName,
    'productPrice': productPrice,
    'imageUrl': imageUrl,
    'isFavourite': isFavourite,
  });
}
