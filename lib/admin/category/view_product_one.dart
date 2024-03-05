import 'dart:io';

import 'package:firstproject/admin/adminfunction/update_product.dart';
import 'package:firstproject/functions/juice_function.dart';
import 'package:firstproject/model/biriyanimodel/product1model.dart';
import 'package:firstproject/functions/biriyani_function.dart';
import 'package:flutter/material.dart';

class Viewproduct extends StatefulWidget {
  const Viewproduct({Key? key}) : super(key: key);

  @override
  State<Viewproduct> createState() => _ViewproductState();
}

class _ViewproductState extends State<Viewproduct> {
  @override
  Widget build(BuildContext context) {
    getAllproducts1();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text(
          'BIRIYANI',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: product1ListNotifier,
              builder: (BuildContext ctx, List<ProductModel1> productList,
                  Widget? child) {
                return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    final product = productList[index];
                    return Container(
                      width: 120,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image(
                                image: FileImage(File(product.imagepath)),
                                width: 200,
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Price: ${product.price}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                ElevatedButton.icon(
                                    onPressed: () {
                                      deletproducts3(index);
                                      setState(() {});
                                      getAllproducts3();
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    label: const Text('Delete')),
                                IconButton(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                          name: product.name,
                                          price: product.price,
                                          imagepath: product.imagepath,
                                          index: index,
                                        ),
                                      ),
                                    );

                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.orange[300],
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'TOTAL AMOUNT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '₹ ${totalprice1()}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

double totalprice1() {
  double totals = 0;
  for (var item in product1ListNotifier.value) {
    totals += double.parse(item.price);
  }
  return totals;
}
