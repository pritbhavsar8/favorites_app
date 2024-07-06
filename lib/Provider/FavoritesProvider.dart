import 'package:favorites_app/Model/Product.dart';
import 'package:flutter/cupertino.dart';

class FavoritesProvider extends ChangeNotifier
{
  List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  void addProduct(Product product) {
    _favorites.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _favorites.remove(product);
    notifyListeners();
  }
}

