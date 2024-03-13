import 'package:firstproject/functions/cart_functions.dart';
import 'package:firstproject/view/admin/category/view_products.dart';
import 'package:firstproject/view/buy_now.dart';
import 'package:flutter/material.dart';

class ChartProvider extends ChangeNotifier {
  chartfunction() {
    // totalprice1();
    // totalcartprice();
    //  totalpricebuy();

    double totalcartprice() {
      double totals = 0;
      for (var item in cartListNotifer.value) {
        totals += num.parse(item.price);
      }
      return totals;
    }
  }
}
