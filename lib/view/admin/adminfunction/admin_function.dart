import 'package:firstproject/functions/food_function.dart';
import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:firstproject/model/newmodel/new_food_mode.dart';
import 'package:hive/hive.dart';

Future<void> deleteall() async {
  await Hive.box<NewFoodModel>('newadded_db').clear();
  await Hive.box<CartModel>('cart_db').clear();
  await Hive.box<BuynowModel>('buy_db').clear();
  newFoodModelListNotifier.notifyListeners();
}
