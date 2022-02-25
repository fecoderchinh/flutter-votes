import 'package:flutter/material.dart';
import 'package:votes/pages/home.dart';
import 'package:votes/pages/result.dart';
import 'package:votes/pages/step_form.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Danh sách trang'),
          ),
          ListTile(
            title: const Text('Trang chủ'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, HomePage.routeName);
            },
            selectedColor: Colors.red,
          ),
          ListTile(
            title: const Text('Kết quả'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, Result.routeName);
            },
          ),
          ListTile(
            title: const Text('Form'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, StepForm.routeName);
            },
          ),
        ],
      ),
    );
  }
}