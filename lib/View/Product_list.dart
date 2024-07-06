import 'dart:convert';

import 'package:favorites_app/Model/Product.dart';
import 'package:favorites_app/Provider/FavoritesProvider.dart';
import 'package:favorites_app/View/FavoritesScreen.dart';
import 'package:favorites_app/View/productView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product>? alldata;
  FavoritesProvider? provider;

  getdata() async
  {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      setState(() {
        alldata = json.map<Product>((obj)=>Product.fromJson(obj)).toList();
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FavoritesProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FavoritesScreen(),)
            );
          }, icon: Icon(Icons.favorite))
        ],
      ),
        body: (alldata==null)?Center(child: CircularProgressIndicator(),):ListView.builder(
      itemCount: alldata!.length,
      itemBuilder: (context,index)
      {
        return ListTile(
          leading: Image.network(alldata![index].image.toString()),
          title: Text(alldata![index].title.toString()),
          subtitle: Text(alldata![index].rating!.rate.toString()),
          trailing: IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: (){
              provider!.addProduct(alldata![index]);
            },
          ),
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>ProductView(
                  obj:alldata![index],
                ))
            );
          },
        );
      },
    ),

    );
  }
}
