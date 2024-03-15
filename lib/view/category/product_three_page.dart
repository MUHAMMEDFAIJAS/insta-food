import 'dart:io';

import 'package:firstproject/controller/food_model_provider.dart';
import 'package:firstproject/controller/search_provider.dart';
import 'package:firstproject/view/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../functions/food_function.dart';
import '../../model/newmodel/new_food_model.dart';

class Product3 extends StatelessWidget {
  const Product3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodProvider>(context);
    final searchprovider3 = Provider.of<SearchProvider>(context);
    provider.getallproductsprovider();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text(
          'JUICES',
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
                  searchprovider3.searchfunction3(value);
                  searchprovider3.searchListUpdate3();
                },
                decoration: const InputDecoration(
                  iconColor: Colors.white,
                  hintText: 'search for juices...',
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
                        foodModel.catagory.toLowerCase() == 'juice')
                    .toList();
                return searchprovider3.search3.isNotEmpty
                    ? searchprovider3.searchedList3.isEmpty
                        ? const Center(
                            child: Text('No value'),
                          )
                        : gridview(searchprovider3.searchedList3)
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
