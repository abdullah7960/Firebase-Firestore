import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestore/view/screen/product_item.dart';
import 'package:firebase_firestore/view/screen/products_screens/products.dart';
import 'package:flutter/material.dart';

import 'adduser_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? productName;
  String? productPrice;
  String? imageUrl;
  late bool isFavourite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.lightBlue,
              child: const Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 30),
                    child: Icon(
                      Icons.list,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 30),
                    child: Text(
                      "Drawer",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.orangeAccent,
              ),
              title: const Text(
                "Home Page",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Navigator.of(context).pushReplacementNamed(HomePage.routeName);
              },
            ),
            const Divider(
              height: 10,
              color: Colors.black,
              indent: 65,
            ),
            ListTile(
              leading: const Icon(
                Icons.add_box,
                color: Colors.orangeAccent,
              ),
              title: const Text(
                "Add Gadgets ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddUser(),
                  ),
                );
              },
            ),
            const Divider(
              height: 10,
              indent: 65,
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(
                Icons.add_box,
                color: Colors.orangeAccent,
              ),
              title: const Text(
                "Products Screen ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProductScreen(),
                  ),
                );
              },
            ),
            const Divider(
              height: 10,
              indent: 65,
              color: Colors.black,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("GADGETS LIST"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_b_and_w,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.lightBlue,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection("prince335055").snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      productName = data['productName'];
                      productPrice = data['productPrice'];
                      imageUrl = data['imageUrl'];
                      isFavourite = data['isFavourite'];
                      return ProductItem(
                          pic: imageUrl!,
                          pName: productName!,
                          pPrice: productPrice!,
                          isFav: isFavourite);
                      // print(data['productName']);
                      // print(data['imageUrl']);

                      // ProductItem(
                      //     imageUrl: imageUrl.toString(),
                      //     isFavourite: isFavourite,
                      //     productName: productName.toString(),
                      //     productPrice: productPrice.toString());
                    });
          }),
    );
  }
}
