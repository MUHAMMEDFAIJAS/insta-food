import 'dart:io';

import 'package:firstproject/model/biriyanimodel/product1model.dart';
import 'package:firstproject/functions/biriyani_function.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final String name;
  final String price;
  final String imagepath;
  final int index;

  const EditScreen({
    Key? key,
    required this.name,
    required this.price,
    required this.imagepath,
    required this.index,
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
    super.initState();
    nameContrl = TextEditingController(text: widget.name);
    priceContrl = TextEditingController(text: widget.price);
    _selectImage = widget.imagepath.isNotEmpty ? File(widget.imagepath) : null;
  }

  @override
  void dispose() {
    nameContrl.dispose();
    priceContrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(
          child: Text(
            "EDIT Product",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
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
                      backgroundColor: const Color.fromARGB(255, 25, 25, 81),
                      backgroundImage: _selectImage != null
                          ? FileImage(_selectImage!)
                          : const AssetImage("assets/images/default_image.jpg")
                              as ImageProvider,
                    ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: _pickImgGallery,
                      child: const Text('Choose Image'),
                    ),
                    ElevatedButton(
                      onPressed: _pickImageFromCam,
                      child: const Text('Take Photo'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: updateAll,
                  child: const Text('Update Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateAll() async {
    final namelx = nameContrl.text;
    final pricelx = priceContrl.text;
    final imagelx = _selectImage?.path;

    if (namelx.isEmpty || pricelx.isEmpty || imagelx == null) {
      return;
    } else {
      final update =
          ProductModel1(name: namelx, price: pricelx, imagepath: imagelx);
      editproductone(widget.index, update);
    }
  }

  void _pickImgGallery() {
    // Implement image picking from gallery
  }

  void _pickImageFromCam() {
    // Implement image picking from camera
  }
}
