import 'package:firstproject/functions/cart_functions.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  Cartfuntion cartfun = Cartfuntion();

  void addcartprovider(value) {
    cartfun.addToCart(value);
  }

  void getallcartsprovider() {
    cartfun.getAllCart();
  }

  void deletecartprovider(index) {
    cartfun.deletcartproduct(index);
  }

  double totalcartprice() {
    double totals = 0;
    for (var item in cartListNotifer.value) {
      totals += num.parse(item.price);
    }
    return totals;
  }
}
