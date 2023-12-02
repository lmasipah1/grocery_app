import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //a list of all items on sale
  final List _shopItems = [
    //  [itenName, itemPrice, imagePath, color]
    ['Avocado', 6.99, 'assets/images/avocado.png', Colors.green],
    ['Banana', 2.99, 'assets/images/banana.png', Colors.yellow],
    ['Chicken', 89.99, 'assets/images/chicken.png', Colors.brown],
    ['Water', 7.99, 'assets/images/water.png', Colors.blue],
  ];

  get shopItems => _shopItems;

  // ignore: prefer_final_fields
  List _cartItems = [];

  get cartItems => _cartItems;

  //add item to cart
  void addItemsToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemsFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += _cartItems[i][1];
    }
    return totalPrice.toStringAsFixed(2);
  }
}
