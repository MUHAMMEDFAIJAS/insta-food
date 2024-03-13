// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:firstproject/controller/add_food_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/newmodel/new_food_mode.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  File? _image;
  String dropdownvalue = 'biriyani';

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
    var items = [
      'biriyani',
      'burger',
      'juice',
    ];
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
                  DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          border: const Border(
                              bottom: BorderSide(style: BorderStyle.solid))),
                      height: 1,
                    ),
                  ),
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
    final provider = Provider.of<FoodProvider>(context, listen: false);
    final newname = _nameController.text.trim();
    final newprice = _priceController.text.trim();

    if (newname.isEmpty || newprice.isEmpty) {
      return;
    }
    final product = NewFoodModel(
      name: newname,
      price: newprice,
      imagepath: _image!.path,
      catagory: dropdownvalue,
    );
    // provider.newAddedFood(product);
    //  newAddedFood(product);
    
    provider.newAddedFoodProvider(product);

    Navigator.pop(context);
  }
}
