import 'package:flutter/material.dart';

import '../../widget/custom_button.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Product',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white.withOpacity(.7),
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Name'),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Description'),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  onChanged: (value) {},
                  items: <String>['Option 1', 'Option 2', 'Option 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Price'),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Stock Quantity'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                CustomButton(
                  backgroundColor: Colors.green.shade400,
                  title: 'Add Product',
                  foregroundColor: Colors.white,
                  callback: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
