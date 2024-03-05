// ignore_for_file: constant_identifier_names

import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:firstproject/model/biriyanimodel/product1model.dart';
import 'package:firstproject/model/burgermodel/product2model.dart';
import 'package:firstproject/model/juicemodel/product3model.dart';
import 'package:firstproject/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

 const SAVE_KEY =' UserLgedIn';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ProductModel1Adapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(CartModelAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(Product2ModelAdapter());
  }
  if (!Hive.isAdapterRegistered(3)) {
    Hive.registerAdapter(Product3ModelAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(BuynowModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
