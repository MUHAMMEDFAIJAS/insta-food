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
    dbfff.deleteNew(index);
  }

  editproductsprovider(int index, NewFoodModel value) {
    dbfff.editNewFood(index, value);
  }
}
