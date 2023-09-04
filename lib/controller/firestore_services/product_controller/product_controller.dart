import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/product_model/products.dart';

Future<ProductsResponse> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return ProductsResponse.fromJson(jsonData);
  } else {
    throw Exception('Failed To Fetch Data');
  }
}
