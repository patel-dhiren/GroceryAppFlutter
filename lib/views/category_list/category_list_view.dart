import 'package:flutter/material.dart';
import 'package:grocery_app/constants/constants.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Category List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppConstant.categoryView);
        },
        backgroundColor: Colors.green.shade100,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
