import 'dart:io';

import 'package:firstproject/admin/adminfunction/update_product.dart';
import 'package:firstproject/model/juicemodel/product3model.dart';

import 'package:firstproject/functions/juice_function.dart';
import 'package:flutter/material.dart';


class Viewproductthree extends StatefulWidget {
  const Viewproductthree({super.key});

  @override
  State<Viewproductthree> createState() => _ViewproductthreeState();
}

class _ViewproductthreeState extends State<Viewproductthree> {
  @override
  Widget build(BuildContext context) {
    getAllproducts3();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text('JUICES'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: product3ListNotifier,
              builder: (BuildContext ctx, List<Product3Model> productList,
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
                      '₹ ${totalprice3()}',
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

double totalprice3() {
  double totals = 0;
  for (var item in product3ListNotifier.value) {
    totals += double.parse(item.price);
  }
  return totals;
}
