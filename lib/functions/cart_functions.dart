import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<CartModel>> cartListNotifer = ValueNotifier([]);

class Cartfuntion {
  Future<void> addToCart(CartModel value) async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');
    await cartDB.add(value);
    cartListNotifer.value.add(value);
   
  }

  Future<void> getAllCart() async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');
    cartListNotifer.value.clear();
    cartListNotifer.value.addAll(cartDB.values);
    
  }

  Future<void> deletcartproduct(int index) async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');
    await cartDB.deleteAt(index);
    getAllCart();
    
  }
}
