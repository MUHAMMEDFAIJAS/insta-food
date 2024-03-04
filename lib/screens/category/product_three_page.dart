import 'dart:developer';
import 'dart:io';

import 'package:firstproject/model/juicemodel/product3model.dart';

import 'package:firstproject/functions/burger_function.dart';
import 'package:firstproject/functions/juice_function.dart';
import 'package:firstproject/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Productthree extends StatefulWidget {
  const Productthree({Key? key}) : super(key: key);

  @override
  State<Productthree> createState() => _ProductthreeState();
}

class _ProductthreeState extends State<Productthree> {
  String search = "";
  List<Product3Model> searchedList = [];

  void searchListUpdate() {
    getAllproducts2();
    searchedList = product3ListNotifier.value
        .where(
          (product) =>
              product.name.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    getAllproducts3();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text(
          'JUICESS',
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
                    searchListUpdate();
                  });
                },
                decoration: const InputDecoration(
                  iconColor: Colors.white,
                  hintText: 'search for biriyani',
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
            child: ValueListenableBuilder<List<Product3Model>>(
              valueListenable: product3ListNotifier,
              builder: (BuildContext ctx, List<Product3Model> productList,
                  Widget? child) {
                return search.isNotEmpty
                    ? searchedList.isEmpty
                        ? const Center(
                            child: Text('No value'),
                          )
                        : gridview(searchedList)
                    : gridview(productList);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget gridview(List<Product3Model> productList) {
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
              log(data.name);

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
