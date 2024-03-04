import 'dart:io';

import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:firstproject/functions/buy_now_functions.dart';
import 'package:firstproject/functions/cart_functions.dart';
import 'package:firstproject/screens/buy_now.dart';
import 'package:firstproject/screens/cart_screen.dart';

import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final String price;
  final dynamic imagepath;
  final int index;
  const ProductDetails({
    super.key,
    required this.name,
    required this.price,
    required this.imagepath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    getAllCart();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text(
          'Product Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image(image: FileImage(File(imagepath))),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 75),
                    borderRadius: BorderRadius.circular(15)),
                height: 350,
                width: MediaQuery.of(context).size.width - 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const Text(
                      'discount 40%',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'Price: $price',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent),
                          onPressed: () {
                            addToCart(CartModel(
                                name: name,
                                price: price,
                                imagepath: imagepath));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AddCart()));
                          },
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent),
                          onPressed: () {
                            buynow(BuynowModel(
                              name: name,
                              price: price,
                              imagepath: imagepath,
                            ));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const BuyNowPage()));
                          },
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
