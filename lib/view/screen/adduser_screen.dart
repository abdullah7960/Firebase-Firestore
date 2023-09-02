import 'package:flutter/material.dart';

import '../../controller/firestore_services/operations.dart';

class AddUser extends StatefulWidget {
  static const routeName = 'adduser';
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String? id;
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  String? productName;
  String? productPrice;
  String? imageUrl;
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD GADGETS"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
                labelText: "Product Name",
                icon: Icon(
                  Icons.assignment,
                  color: Colors.orangeAccent,
                ),
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
            onChanged: (value) {
              productName = value;
            },
            controller: productNameController,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
                labelText: "Product Price",
                icon: Icon(
                  Icons.assignment,
                  color: Colors.orangeAccent,
                ),
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
            onChanged: (value) {
              productPrice = value;
            },
            controller: productPriceController,
          ),
          TextField(
            keyboardType: TextInputType.url,
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
                labelText: "Image URL",
                icon: Icon(
                  Icons.assignment,
                  color: Colors.orangeAccent,
                ),
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
            onChanged: (value) {
              imageUrl = value;
            },
            controller: imageUrlController,
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 40),
                  child: TextButton(
                    // style: ButtonStyle(iconColor: Colors.red),
                    onPressed: () {
                      uploadingData(
                          productName!, productPrice!, imageUrl!, isFavourite);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
