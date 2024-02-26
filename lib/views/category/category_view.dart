import 'package:flutter/material.dart';
import 'package:grocery_app/widget/custom_button.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Category', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
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
                  child: Icon(Icons.add, size: 40, color: Colors.grey,),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Category Name'
                  ),
                ),
                SizedBox(height: 8  ,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Category Description'
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 24,),
                CustomButton(
                  backgroundColor: Colors.green.shade400,
                  title: 'Add Category',
                  foregroundColor: Colors.white,
                  callback: () {

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
