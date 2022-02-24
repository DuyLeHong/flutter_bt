import 'package:flutter/material.dart';
import 'package:flutterdemo/homework/screen/product_list_screen.dart';
import 'package:flutterdemo/homework/screen/shop_product_list_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

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
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Product List'),
            onTap: () {
              // Update the state of the app
              Navigator.pushReplacementNamed(
                  context, ProductListScreen.routeName);
              // Then close the drawer
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Shop Product List'),
            onTap: () {
              // Update the state of the app
              Navigator.pushReplacementNamed(
                  context, ShopProductListScreen.routeName);
              // Then close the drawer
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
