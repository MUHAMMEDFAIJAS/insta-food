import 'dart:io';

import 'package:firstproject/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../functions/food_function.dart';
import '../../model/newmodel/new_food_mode.dart';

class Producttwo extends StatefulWidget {
  const Producttwo({Key? key}) : super(key: key);

  @override
  State<Producttwo> createState() => _ProducttwoState();
}

class _ProducttwoState extends State<Producttwo> {
  String search = '';
  List<NewFoodModel> searchedList = [];

  void searchlist() {
    searchedList = newFoodModelListNotifier.value
        .where((NewFoodModel newmodel) =>
            newmodel.catagory.toLowerCase() == 'burger' &&
            newmodel.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    getAllNewFood();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text(
          'BURGER',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white,
              ),
              width: 340,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    search = value;
                    searchlist();
                  });
                },
                decoration: const InputDecoration(
                  iconColor: Colors.white,
                  hintText: 'search for burgers..',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<List<NewFoodModel>>(
              valueListenable: newFoodModelListNotifier,
              builder: (BuildContext ctx, List<NewFoodModel> productList,
                  Widget? child) {
                final filteredList = productList
                    .where((foodModel) =>
                        foodModel.catagory.toLowerCase() == 'burger')
                    .toList();
                return search.isNotEmpty
                    ? searchedList.isEmpty
                        ? const Center(
                            child: Text('No value'),
                          )
                        : gridview(searchedList)
                    : gridview(filteredList);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget gridview(List<NewFoodModel> productList) {
    return productList.isEmpty
        ? const Center(
            child: Text('No products available'),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: productList.length,
            itemBuilder: (context, index) {
              final data = productList[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        name: data.name,
                        price: data.price,
                        imagepath: data.imagepath,
                        index: index,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  surfaceTintColor: Colors.orange,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image(
                              image: FileImage(File(data.imagepath)),
                              height: 80,
                            ),
                            Text(data.name),
                            const Gap(10),
                            Text(data.price),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
