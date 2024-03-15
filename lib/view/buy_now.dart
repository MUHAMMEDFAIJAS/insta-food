// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:firstproject/controller/buy_now_provider.dart';
import 'package:firstproject/model/buynow/buynowmodel.dart';

import 'package:firstproject/functions/buy_now_functions.dart';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class BuyNowPage extends StatelessWidget {
  const BuyNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final buyprovider = Provider.of<Buynowprovider>(context);
    buyprovider.getallbuy();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text(
          'MY ORDERS',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: buyListNotifer,
              builder: (BuildContext ctx, List<BuynowModel> buynowList,
                  Widget? child) {
                return ListView.builder(
                  itemCount: buynowList.length,
                  itemBuilder: (context, index) {
                    final data = buynowList[index];

                    return SizedBox(
                      width: 250,
                      height: 280,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: FileImage(File(data.imagepath)),
                                      height: 90,
                                      width: 200,
                                    ),
                                  ),
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Gap(8),
                                  Text(
                                    data.price,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const Text(
                                    'delivery with in : 2 hours',
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 20),
                                  ),
                                  const Gap(10),
                                  ElevatedButton(
                                    onPressed: () {
                                      buyprovider.deleteallbuy(index);
                                    },
                                    child: const Text('cancel order'),
                                  )
                                ],
                              ),
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
            color: Colors.orange[200],
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Center(
                  child: Text(
                    'THANK YOU FOR SHOPPING',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// double totalpricebuy() {
//   double totals = 0;
//   for (var item in buyListNotifer.value) {
//     totals += num.parse(item.price);
//   }
//   return totals;
// }
