import 'dart:io';
import 'package:firstproject/controller/buy_now_provider.dart';
import 'package:firstproject/controller/cart_provider.dart';
import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:firstproject/view/buy_now.dart';
import 'package:firstproject/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

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
    final detailsprovider = Provider.of<CartProvider>(context);
    final buynowprovider = Provider.of<Buynowprovider>(context);
    detailsprovider.getallcartsprovider();
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
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image(image: FileImage(File(imagepath))),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                height: 300,
                width: MediaQuery.of(context).size.width - 20,
                child: Card(
                  elevation: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.orange),
                      ),
                      const Text(
                        'discount  40%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.orangeAccent),
                      ),
                      Text(
                        'Price: $price',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.orange,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(40),
              SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    onPressed: () {
                      detailsprovider.addcartprovider(CartModel(
                          name: name, price: price, imagepath: imagepath));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddCart()));
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    onPressed: () {
                      buynowprovider.addbuynow(BuynowModel(
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
              )),
            ],
          ),
        ),
      ),
    );
  }
}
