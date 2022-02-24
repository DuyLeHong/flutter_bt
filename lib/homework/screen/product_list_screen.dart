import 'package:flutter/material.dart';
import 'package:flutterdemo/homework/provider/cart_order.dart';
import 'package:flutterdemo/homework/provider/product.dart';
import 'package:flutterdemo/homework/screen/product_detail_screen.dart';

import '../drawer_menu.dart';
import 'cart_order_screen.dart';

class ProductListScreen extends StatefulWidget {
  static const routeName = '/product-list';
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  ProductListScreenState createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final productContainer = ProductContainer.of(context);
    return Scaffold(
        drawer: const DrawerMenu(),
        appBar: AppBar(
          title: const Text('Product List'),
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: const Icon(Icons.arrow_back)),
          actions: [
            CartWidget(
              count: CartOrderContainer.of(context).cartItems.length,
              onTap: () {
                Navigator.pushNamed(context, CartOrderScreen.routeName);
              },
            )
          ],
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
          itemCount: productContainer.items.length,
          itemBuilder: (context, index) {
            final product = productContainer.items[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetailScreen.routeName,
                        arguments: product);
                  },
                  child: Image(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black87,
                  leading: IconButton(
                    color: Colors.red,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                  title: Text(
                    product.name,
                    textAlign: TextAlign.center,
                  ),
                  trailing: CartWidget(
                    count: CartOrderContainer.of(context)
                        .cartItems
                        .firstWhere(
                          (item) => item.id == product.id,
                          orElse: () => product.copyWith(quantity: 0),
                        )
                        .quantity,
                    onTap: () {
                      CartOrderContainer.of(context).addToCart(product);
                    },
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class CartWidget extends StatelessWidget {
  final int count;
  final VoidCallback onTap;
  const CartWidget({
    Key? key,
    required this.count,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          IconButton(onPressed: onTap, icon: const Icon(Icons.shopping_cart)),
          Positioned(
            right: 5,
            top: 10,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.5),
              ),
              constraints: const BoxConstraints(
                minWidth: 15,
                minHeight: 15,
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
