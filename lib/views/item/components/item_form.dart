import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_app/model/category.dart';
import 'package:grocery_app/model/item.dart';
import 'package:image_picker/image_picker.dart';

import '../../../firebase/firebase_service.dart';
import '../../../utils/app_util.dart';
import '../../../widget/custom_button.dart';

class ItemForm extends StatefulWidget {
  final Item? item;

  ItemForm({this.item});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();
  final _itemNameController = TextEditingController();
  final _itemDescriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockQuantityController = TextEditingController();
  String? _categoryId;
  String? _selectedUnit;
  XFile? _newImage;
  String? existingImageUrl;
  List<Category> _categories = [];

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemDescriptionController.dispose();
    _priceController.dispose();
    _stockQuantityController.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    if (_formKey.currentState!.validate() &&
        (existingImageUrl != null || _newImage != null)) {
      _formKey.currentState!.save();

      bool? result = await FirebaseService().addOrUpdateItem(
          name: _itemNameController.text,
          description: _itemDescriptionController.text,
          newImage: _newImage,
          context: context,
          existingImageUrl: existingImageUrl,
          createdAt: widget.item?.createdAt,
          price: double.parse(_priceController.text),
          stock: int.parse(_stockQuantityController.text),
          unit: _selectedUnit!,
          itemId: widget.item?.id,
          categoryId: _categoryId!);

      if (result == true) {
        AppUtil.showToast('Item changed successfully');
        Navigator.pop(context);
      } else {
        AppUtil.showToast('Error occurred while managing item.');
      }
    }
  }

  Future<void> pickImage() async {
    var image = await AppUtil.pickImageFromGallery();

    if (image != null) {
      setState(() {
        _newImage = image;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      existingImageUrl = widget.item!.imageUrl;
      _itemNameController.text = widget.item!.name;
      _itemDescriptionController.text = widget.item!.description;
      _priceController.text = widget.item!.price.toString();
      _stockQuantityController.text = widget.item!.stock.toString();
      _categoryId = widget.item!.categoryId;
      _selectedUnit = widget.item!.unit;
    }
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white.withOpacity(.7),
                    child: _newImage == null && existingImageUrl != null
                        ? CircleAvatar(
                            radius: 60,
                            foregroundImage: NetworkImage(existingImageUrl!),
                          )
                        : _newImage != null
                            ? CircleAvatar(
                                radius: 60,
                                foregroundImage: FileImage(
                                  File(_newImage!.path),
                                ),
                              )
                            : Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.grey,
                              ),
                  ),
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _itemNameController,
                  decoration: InputDecoration(labelText: 'Item Name'),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an item name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _itemDescriptionController,
                  decoration: InputDecoration(labelText: 'Item Description'),
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an item description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _priceController,
                        decoration: InputDecoration(labelText: 'Price'),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a price';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _stockQuantityController,
                        decoration:
                            InputDecoration(labelText: 'Stock Quantity'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the stock quantity';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _categoryId,
                  decoration: InputDecoration(labelText: 'Select Category'),
                  items: _categories
                      .map<DropdownMenuItem<String>>((Category category) {
                    return DropdownMenuItem<String>(
                      value: category.id,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _categoryId = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedUnit,
                  decoration: InputDecoration(labelText: 'Select Unit'),
                  items: <String>['Kg', 'Litre', 'Piece','Dozen']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedUnit = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a unit';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                CustomButton(
                  backgroundColor: Colors.green.shade400,
                  title: widget.item == null ? 'Add Item' : 'Update Item',
                  foregroundColor: Colors.white,
                  callback: _saveForm,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _loadCategories() async {
    List<Category> categories = await FirebaseService().loadCategories();
    setState(() {
      _categories = categories;
    });
  }
}
