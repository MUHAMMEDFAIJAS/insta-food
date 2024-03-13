import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<BuynowModel>> buyListNotifer = ValueNotifier([]);


class  Buyfunction{
  


Future<void> buynow(BuynowModel value) async {
  final buynowDb = await Hive.openBox<BuynowModel>('buy_db');
  await buynowDb.add(value);
  await getbuy();
  buyListNotifer.notifyListeners();
}

Future<void> getbuy() async {
  final buynowDb = await Hive.openBox<BuynowModel>('buy_db');
  buyListNotifer.value.clear();
  buyListNotifer.value.addAll(buynowDb.values);
  buyListNotifer.notifyListeners();
}

Future<void> deletorder(int index) async {
  final buynowDb = await Hive.openBox<BuynowModel>('buy_db');
  await buynowDb.deleteAt(index);
  getbuy();
}
}