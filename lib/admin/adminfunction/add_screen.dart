// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:firstproject/model/biriyanimodel/product1model.dart';
import 'package:firstproject/model/burgermodel/product2model.dart';
import 'package:firstproject/model/juicemodel/product3model.dart';

import 'package:firstproject/functions/biriyani_function.dart';
import 'package:firstproject/functions/burger_function.dart';
import 'package:firstproject/functions/juice_function.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  State<Addscreen> createState() => _AddscreenState();
}

enum Database { Briyani, Burger, Juices }

class _AddscreenState extends State<Addscreen> {
  File? _image;

  Database selectedDb = Database.Briyani;

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text('Add Products'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _image == null
                      ? ElevatedButton(
                          onPressed: _getImageFromGallery,
                          child: const Text('Add Image'),
                        )
                      : Image.file(_image!),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter the product name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  DropdownButton<Database>(
                      value: selectedDb,
                      items: const [
                        DropdownMenuItem(
                            value: Database.Briyani, child: Text('BIRIYANI')),
                        DropdownMenuItem(
                            value: Database.Burger, child: Text('BURGER')),
                        DropdownMenuItem(
                            value: Database.Juices, child: Text('JUICES'))
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedDb = value!;
                        });
                      }),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      addbuttonpressed();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Product'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addbuttonpressed() async {
    if (selectedDb == Database.Briyani) {
      final newname = _nameController.text.trim();
      final newprice = _priceController.text.trim();

      if (newname.isEmpty || newprice.isEmpty) {
        return;
      }
      final product = ProductModel1(
        name: newname,
        price: newprice,
        imagepath: _image!.path,
      );
      addproducts1(product);

      Navigator.pop(context);
    } else if (selectedDb == Database.Burger) {
      final newname = _nameController.text.trim();
      final newprice = _priceController.text.trim();

      if (newname.isEmpty || newprice.isEmpty) {
        return;
      }
      final product = Product2Model(
        name: newname,
        price: newprice,
        imagepath: _image!.path,
      );
      addproducts2(product);

      Navigator.pop(context);
    } else if (selectedDb == Database.Juices) {
      final newname = _nameController.text.trim();
      final newprice = _priceController.text.trim();

      if (newname.isEmpty || newprice.isEmpty) {
        return;
      }
      final product = Product3Model(
        name: newname,
        price: newprice,
        imagepath: _image!.path,
      );
      addproducts3(product);

      Navigator.pop(context);
    }
  }
}
