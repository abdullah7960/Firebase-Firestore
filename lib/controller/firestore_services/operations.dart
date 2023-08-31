import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(String _productName, String _productPrice,
    String _imageUrl, bool _isFavourite) async {
  await FirebaseFirestore.instance.collection("prince335055").add({
    'productName': _productName,
    'productPrice': _productPrice,
    'imageUrl': _imageUrl,
    'isFavourite': _isFavourite,
  });
}
