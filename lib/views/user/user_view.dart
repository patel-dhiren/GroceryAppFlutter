import 'package:flutter/material.dart';
import 'package:grocery_app/constants/constants.dart';
import 'package:grocery_app/firebase/firebase_service.dart';
import 'package:grocery_app/model/user.dart';

import '../../gen/assets.gen.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'User List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: StreamBuilder<List<UserData>>(
            stream: FirebaseService().userStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.redAccent,
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      UserData user = snapshot.data![index];
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            isThreeLine: true,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppConstant.categoryView,
                                  arguments: snapshot.data![index]);
                            },
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.orange.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  Assets.images.users.path,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            title: Text(
                              user.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Contact : ${user.contact}\nEmail : ${user.email}'),
                            /*isThreeLine: true,*/
                          ),
                        ),
                      );
                    },

                  ),
                );
              } else {
                return Center(
                  child: Text('No categories found'),
                );
              }
            }),
      ),
    );
  }
}
