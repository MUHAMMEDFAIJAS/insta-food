import 'package:firstproject/model/burgermodel/product2model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Product2Model>> product2ListNotifier = ValueNotifier([]);

Future<void> addproducts2(Product2Model value) async {
  final product2DB = await Hive.openBox<Product2Model>('product2DB');
  await product2DB.add(value);
  product2ListNotifier.value.add(value);
  product2ListNotifier.notifyListeners();
  getAllproducts2();
}

Future<void> getAllproducts2() async {
  final product2DB = await Hive.openBox<Product2Model>('product2DB');
  product2ListNotifier.value.clear();
  product2ListNotifier.value.addAll(product2DB.values);
  product2ListNotifier.notifyListeners();
}

Future<void> deletproducts2(int index) async {
  final productDB = await Hive.openBox<Product2Model>('product2DB');
  await productDB.deleteAt(index);
  getAllproducts2();
}
