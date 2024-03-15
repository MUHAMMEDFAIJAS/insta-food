import 'package:firstproject/functions/buy_now_functions.dart';
import 'package:firstproject/functions/cart_functions.dart';
import 'package:firstproject/functions/food_function.dart';
import 'package:flutter/material.dart';

class Totalpriceprovider extends ChangeNotifier {
  double totalprice1() {
    double totals = 0;
    for (var item in newFoodModelListNotifier.value) {
      totals += double.parse(item.price);
    }
    return totals;
  }

  double totalpricebuy() {
    double totals = 0;
    for (var item in buyListNotifer.value) {
      totals += num.parse(item.price);
    }
    return totals;
  }

  double totalcartprice() {
    double totals = 0;
    for (var item in cartListNotifer.value) {
      totals += num.parse(item.price);
    }
    return totals;
  }
}
