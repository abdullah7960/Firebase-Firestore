import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  ProductItem(
      {super.key,
      required this.pic,
      required this.pName,
      required this.pPrice,
      required this.isFav});
  String pic;
  String pName;
  String pPrice;
  bool isFav;
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
          widget.pic,
        ),
      ),
      title: Text(widget.pName),
      subtitle: Text(widget.pPrice),
      trailing: Text(widget.isFav.toString()),
    );
    ;
  }
}
