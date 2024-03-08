import 'dart:io';

import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:firstproject/functions/buy_now_functions.dart';
import 'package:firstproject/functions/cart_functions.dart';
import 'package:firstproject/screens/buy_now.dart';
import 'package:flutter/material.dart';

class AddCart extends StatefulWidget {
  const AddCart({
    super.key,
  });

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  @override
  Widget build(BuildContext context) {
    getAllCart();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'CART',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: Colors.orange[300],
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: cartListNotifer,
              builder:
                  (BuildContext ctx, List<CartModel>? cartList, Widget? child) {
                if (cartList == null || cartList.isEmpty) {
                  return const Center(
                    child: Text('Add items to your cart'),
                  );
                }
                return ListView.builder(
                  itemCount: cartListNotifer.value.length,
                  itemBuilder: (context, index) {
                    final data = cartListNotifer.value[index];

                    return Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      height: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image(
                                image: FileImage(File(data.imagepath)),
                                width: 200,
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 25),
                                Text(
                                  data.name,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Price: ${data.price}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                ElevatedButton(
                                  onPressed: () {
                                    buynow(BuynowModel(
                                      name: data.name,
                                      price: data.price,
                                      imagepath: data.imagepath,
                                    ));
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BuyNowPage()));
                                  },
                                  child: const Text('Buy Now'),
                                ),
                                ElevatedButton.icon(
                                    onPressed: () {
                                      deletcartproduct(index);
                                      setState(() {});
                                      getAllCart();
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    label: const Text('Delete'))
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
                      '₹ ${totalcartprice()}',
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

double totalcartprice() {
  double totals = 0;
  for (var item in cartListNotifer.value) {
    totals += num.parse(item.price);
  }
  return totals;
}
