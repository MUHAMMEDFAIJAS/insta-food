import 'package:firstproject/model/juicemodel/product3model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Product3Model>> product3ListNotifier = ValueNotifier([]);

Future<void> addproducts3(Product3Model value) async {
  final product3DB = await Hive.openBox<Product3Model>('product_db3');
  await product3DB.add(value);
  product3ListNotifier.value.add(value);
  product3ListNotifier.notifyListeners();
  getAllproducts3();
}

Future<void> getAllproducts3() async {
  final product3DB = await Hive.openBox<Product3Model>('product_db3');
  product3ListNotifier.value.clear();
  product3ListNotifier.value.addAll(product3DB.values);
  product3ListNotifier.notifyListeners();
}

Future<void> deletproducts3(int index) async {
  final productDB = await Hive.openBox<Product3Model>('product_db3');
  await productDB.deleteAt(index);
  getAllproducts3();
}

void searchproducts3(String query) async {
  final productDB = await Hive.openBox<Product3Model>('product_db3');
  final searchResults = productDB.values.where((product3DB) =>
      product3DB.name.toLowerCase().contains(query.toLowerCase()) ||
      product3DB.price.toLowerCase().contains(query.toLowerCase()));

  product3ListNotifier.value = searchResults.toList();
  product3ListNotifier.notifyListeners();
}
