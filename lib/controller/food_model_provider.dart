import 'dart:developer';

import 'package:firstproject/functions/food_function.dart';
import 'package:firstproject/model/newmodel/new_food_model.dart';
import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  DbFunction dbfff = DbFunction();

  newAddedFoodProvider(NewFoodModel value) {
    dbfff.newAddedFood(value);
  }

  getallproductsprovider() {
    dbfff.getAllNewFood();
  }

  deleteproductsprovider(index) {
    log('delete');
    dbfff.deleteNew(index);
  }

  editproductsprovider(int index, NewFoodModel value) {
    log('dddd');
    dbfff.editNewFood(index, value);
    notifyListeners();
  }
}
