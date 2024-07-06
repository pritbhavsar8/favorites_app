import 'package:favorites_app/Model/Product.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  Product obj;
  ProductView({required this.obj});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product View"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.network(widget.obj.image.toString()),
          Text(widget.obj.title.toString()),
          Text(widget.obj.description.toString()),
          Text(widget.obj.rating!.rate.toString()),
        ],
      ),

    );
  }
}
