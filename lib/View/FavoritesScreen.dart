import 'package:favorites_app/Provider/FavoritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget
{
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
{
  @override
  Widget build(BuildContext context)
  {
    final favorites = Provider.of<FavoritesProvider>(context).favorites;
    return Scaffold(
         appBar: AppBar(
         title: Text('Favorites'),
       ),
     body: ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index)
    {
       final product = favorites[index];
       return ListTile(
       title: Text(product.title.toString()),
       trailing: IconButton(
         icon: Icon(Icons.remove),
         onPressed: () {
            Provider.of<FavoritesProvider>(context, listen: false).removeProduct(product);
         },
       ),
     );
    }
     )
    );
  }
}
