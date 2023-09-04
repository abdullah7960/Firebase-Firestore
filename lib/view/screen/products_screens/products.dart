import 'package:flutter/material.dart';

import '../../../controller/firestore_services/product_controller/product_controller.dart';
import '../../../model/product_model/products.dart';

// Import your API function here

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<ProductsResponse> products;

  @override
  void initState() {
    super.initState();
    products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<ProductsResponse>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.products.isEmpty) {
            return Center(child: Text('No products available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.products.length,
              itemBuilder: (context, index) {
                final product = snapshot.data!.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle:
                      Text('Price: \$${product.price.toStringAsFixed(2)}'),
                  // Add more widgets to display other product information here
                );
              },
            );
          }
        },
      ),
    );
  }
}
