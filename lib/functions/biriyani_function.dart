import 'package:firstproject/model/biriyanimodel/product1model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<ProductModel1>> product1ListNotifier = ValueNotifier([]);

Future<void> addproducts1(ProductModel1 value) async {
  final product1DB = await Hive.openBox<ProductModel1>('product_db');
  await product1DB.add(value);
  product1ListNotifier.value.add(value);
  product1ListNotifier.notifyListeners();

  getAllproducts1();
}

Future<void> getAllproducts1() async {
  final product1DB = await Hive.openBox<ProductModel1>('product_db');
  product1ListNotifier.value.clear();
  product1ListNotifier.value.addAll(product1DB.values);
  product1ListNotifier.notifyListeners();
}

Future<void> deletproducts(int index) async {
  final productDB = await Hive.openBox<ProductModel1>('product_db');
  await productDB.deleteAt(index);
  getAllproducts1();
}

Future<void> editproductone(index, ProductModel1 value) async {
  final productDB = await Hive.openBox<ProductModel1>('product_db');
  product1ListNotifier.value.clear();
  product1ListNotifier.value.addAll(productDB.values);

  product1ListNotifier.notifyListeners();
  productDB.putAt(index, value);
  getAllproducts1();
}
