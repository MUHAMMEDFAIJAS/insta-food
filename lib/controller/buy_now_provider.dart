import 'package:firstproject/functions/buy_now_functions.dart';
import 'package:flutter/material.dart';

class Buynowprovider extends ChangeNotifier {
  Buyfunction buyfun = Buyfunction();

  void addbuynow(value) {
    buyfun.buynow(value);
  }

  void getallbuy() {
    buyfun.getbuy();
  }

  void deleteallbuy(index) {
    buyfun.deletorder(index);
  }
}
