import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {

          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppConstant.productView);
        },
        backgroundColor: Colors.green.shade100,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
