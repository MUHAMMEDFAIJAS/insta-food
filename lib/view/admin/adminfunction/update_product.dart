import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../controller/food_model_provider.dart';

import '../../../model/newmodel/new_food_model.dart';

class EditScreen extends StatefulWidget {
  final String name;
  final String price;
  final String imagepath;
  final int index;
  final String catogery;

  const EditScreen({
    Key? key,
    required this.name,
    required this.price,
    required this.imagepath,
    required this.index,
    required this.catogery,
  }) : super(key: key);

  @override
  State<EditScreen> createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  TextEditingController nameContrl = TextEditingController();
  TextEditingController priceContrl = TextEditingController();
  File? _selectImage;

  @override
  void initState() {
    nameContrl = TextEditingController(text: widget.name);
    priceContrl = TextEditingController(text: widget.price);
    _selectImage = widget.imagepath.isNotEmpty ? File(widget.imagepath) : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Center(
          child: Text(
            "Edit Product",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundImage: _selectImage != null
                          ? FileImage(_selectImage!)
                          : const AssetImage("assets/images/default_image.jpg")
                              as ImageProvider,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _pickImgGallery,
                    child: const Text('select Image'),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nameContrl,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: priceContrl,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      updateAll(widget.index);
                    },
                    child: const Text('Update Product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateAll(int index) async {
    final provider = Provider.of<FoodProvider>(context, listen: false);
    final newName = nameContrl.text.trim();
    final newPrice = priceContrl.text.trim();
    final newImagePath =
        _selectImage != null ? _selectImage!.path : widget.imagepath;

    if (newName.isEmpty || newPrice.isEmpty || newImagePath.isEmpty) {
      return;
    }
    final update = NewFoodModel(
      name: newName,
      price: newPrice,
      imagepath: newImagePath,
      catagory: widget.catogery,
    );
    provider.editproductsprovider(index, update);
    // setState(() {});
    Navigator.pop(context);
  }

  Future<void> _pickImgGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      _selectImage = File(returnImage.path);
    });
  }
}
