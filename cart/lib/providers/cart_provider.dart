import 'package:cart/models/cart.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cart = [];

  List<Cart> get cart => _cart;

  void addProductsCart(Cart product) {
    if (!existProduct(product.id)) {
      _cart.add(
        Cart(
          id: product.id,
          title: product.title,
          price: product.price,
          rate: product.rate,
          image: product.image,
          count: product.count,
          total: product.price * product.count,
        ),
      );
      notifyListeners();
    }
  }

  void incremetCount(int id) {
    final indexProduct = _cart.indexWhere((p) => p.id == id);

    // Cambiar la cantidad que estaba anteriormente
    _cart[indexProduct] = Cart(
      id: _cart[indexProduct].id,
      title: _cart[indexProduct].title,
      price: _cart[indexProduct].price,
      rate: _cart[indexProduct].rate,
      image: _cart[indexProduct].image,
      count: _cart[indexProduct].count + 1,
      total: _cart[indexProduct].price * (_cart[indexProduct].count + 1),
    );
    notifyListeners();
  }

  void decrementCount(int id) {
    final indexProduct = _cart.indexWhere((p) => p.id == id);

    if (_cart[indexProduct].count > 1) {
      // Cambiar la cantidad que estaba anteriormente
      _cart[indexProduct] = Cart(
        id: _cart[indexProduct].id,
        title: _cart[indexProduct].title,
        price: _cart[indexProduct].price,
        rate: _cart[indexProduct].rate,
        image: _cart[indexProduct].image,
        count: _cart[indexProduct].count - 1,
        total: _cart[indexProduct].price * (_cart[indexProduct].count - 1),
      );
    }
    notifyListeners();
  }

  bool existProduct(int id) {
    final indexProduct = _cart.indexWhere((p) => p.id == id);

    if (indexProduct == -1) {
      return false;
    }

    return true;
  }

  void removeCart() {
    _cart.clear();
    notifyListeners();
  }
}
