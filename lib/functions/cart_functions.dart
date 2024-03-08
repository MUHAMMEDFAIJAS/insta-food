import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<CartModel>> cartListNotifer = ValueNotifier([]);
Future<void> addToCart(CartModel value) async {
  final cartDB = await Hive.openBox<CartModel>('cart_db');
  await cartDB.add(value);

  cartListNotifer.value.add(value);
  cartListNotifer.notifyListeners();
}

Future<void> getAllCart() async {
  final cartDB = await Hive.openBox<CartModel>('cart_db');
  cartListNotifer.value.clear();
  cartListNotifer.value.addAll(cartDB.values);
  cartListNotifer.notifyListeners();
}

Future<void> deletcartproduct(int index) async {
  final cartDB = await Hive.openBox<CartModel>('cart_db');
  await cartDB.deleteAt(index);
  getAllCart();
  cartListNotifer.notifyListeners();
}
