import 'package:firstproject/functions/food_function.dart';
import 'package:flutter/material.dart';

import '../model/newmodel/new_food_model.dart';

class SearchProvider extends ChangeNotifier {
  String search = "";
  String search2 = "";
  String search3 = "";
  List<NewFoodModel> searchedList = [];
  List<NewFoodModel> searchedList2 = [];
  List<NewFoodModel> searchedList3 = [];

  void searchListUpdate() {
    searchedList = newFoodModelListNotifier.value
        .where((NewFoodModel foodModel) =>
            foodModel.catagory.toLowerCase() == 'biriyani' &&
            foodModel.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
    notifyListeners();
  }

  searchfunction(value) {
    search = value;
  }

  void searchListUpdate2() {
    searchedList2 = newFoodModelListNotifier.value
        .where((NewFoodModel foodModel) =>
            foodModel.catagory.toLowerCase() == 'burger' &&
            foodModel.name.toLowerCase().contains(search2.toLowerCase()))
        .toList();
    notifyListeners();
  }

  searchfunction2(value) {
    search2 = value;
  }

  void searchListUpdate3() {
    searchedList3 = newFoodModelListNotifier.value
        .where((NewFoodModel foodModel) =>
            foodModel.catagory.toLowerCase() == 'juice' &&
            foodModel.name.toLowerCase().contains(search3.toLowerCase()))
        .toList();
    notifyListeners();
  }

  searchfunction3(value) {
    search3 = value;
  }
}
