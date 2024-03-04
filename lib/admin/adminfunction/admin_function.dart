

import 'package:firstproject/model/biriyanimodel/product1model.dart';
import 'package:firstproject/model/burgermodel/product2model.dart';
import 'package:firstproject/model/juicemodel/product3model.dart';
import 'package:firstproject/functions/cart_functions.dart';
import 'package:hive/hive.dart';

Future<void> deleteall() async {
  await Hive.box<ProductModel1>('product_db').clear();
  await Hive.box<Product2Model>('product2DB').clear();
  await Hive.box<Product3Model>('product_db3').clear();


  carListNotifer.notifyListeners();
}
