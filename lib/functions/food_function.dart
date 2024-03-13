import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

import '../model/newmodel/new_food_mode.dart';

ValueNotifier<List<NewFoodModel>> newFoodModelListNotifier = ValueNotifier([]);

class DbFunction {
  Future<void> newAddedFood(NewFoodModel value) async {
    final newaddedDB = await Hive.openBox<NewFoodModel>('newadded_db');
    await newaddedDB.add(value);
    newFoodModelListNotifier.value.add(value);
    newFoodModelListNotifier.notifyListeners();
  }

  Future<void> getAllNewFood() async {
    final newaddedDb = await Hive.openBox<NewFoodModel>('newadded_db');
    newFoodModelListNotifier.value.clear();
    newFoodModelListNotifier.value.addAll(newaddedDb.values);
    newFoodModelListNotifier.notifyListeners();
  }

  Future<void> editNewFood(int index, NewFoodModel value) async {
    final newaddedDb = await Hive.openBox<NewFoodModel>('newadded_db');
    newFoodModelListNotifier.value.clear();
    newFoodModelListNotifier.value.addAll(newaddedDb.values);
    newaddedDb.putAt(index, value);
    newFoodModelListNotifier.notifyListeners();
    getAllNewFood();
  }

  Future<void> deleteNew(index) async {
    final newaddedDb = await Hive.openBox<NewFoodModel>('newadded_db');
    newaddedDb.deleteAt(index);
    getAllNewFood();
    newFoodModelListNotifier.notifyListeners();
  }
}
