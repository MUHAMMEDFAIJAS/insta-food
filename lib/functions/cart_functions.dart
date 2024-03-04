import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<CartModel>> carListNotifer = ValueNotifier([]);
Future<void> addToCart(CartModel value) async {
  final cartDB = await Hive.openBox<CartModel>('cart_db');
  await cartDB.add(value);

  carListNotifer.value.add(value);
  carListNotifer.notifyListeners();
}

Future<void> getAllCart() async {
  final cartDB = await Hive.openBox<CartModel>('cart_db');
  carListNotifer.value.clear();
  carListNotifer.value.addAll(cartDB.values);
  carListNotifer.notifyListeners();
}

Future<void> deletcartproduct(int index) async {
  final cartDB = await Hive.openBox<CartModel>('cart_db');
  await cartDB.deleteAt(index);
  getAllCart();
  carListNotifer.notifyListeners();
}
