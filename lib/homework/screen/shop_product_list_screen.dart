import 'package:flutter/material.dart';
import 'package:flutterdemo/homework/provider/cart_order.dart';
import 'package:flutterdemo/homework/provider/product.dart';
import 'package:flutterdemo/homework/screen/product_detail_screen.dart';
import 'package:flutterdemo/homework/screen/product_list_screen.dart';
import 'package:flutterdemo/homework/screen/shop_product_update_screen.dart';
import '../drawer_menu.dart';
import 'auth_screen.dart';
import '../model/product_item.dart';
import 'cart_order_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartOrderContainer(
      child: ProductContainer(
        child: MaterialApp(
          title: 'Material App',
          home: const ProductListScreen(),
          debugShowCheckedModeBanner: false,
          locale: const Locale('en', 'US'),
          routes: {
            // static router
            // '/': (_) => HomePage(), // You can also use MaterialApp's `home` property instead of '/'
            AuthScreenPage.routeName: (context) =>
                const AuthScreenPage(), // No way to pass an argument to FooPage.
            ShopProductListScreen.routeName: (context) =>
                const ShopProductListScreen(),
            ProductListScreen.routeName: (context) => const ProductListScreen(),
            ProductDetailScreen.routeName: (context) =>
                const ProductDetailScreen(),
            CartOrderScreen.routeName: (context) => const CartOrderScreen(),
          },
          onGenerateRoute: generateRoute, // generate router
          onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => const Text('Unknown route'),
          ),
        ),
      ),
    );
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    if (settings.name == ShopProductUpdateScreen.routeName) {
      return MaterialPageRoute(
          builder: (_) {
            //some custom code
            return const ShopProductUpdateScreen();
          },
          settings: settings);
    }
    return null;
  }
}

class ShopProductListScreen extends StatefulWidget {
  static const routeName = '/shop-product-list';
  const ShopProductListScreen({Key? key}) : super(key: key);

  @override
  State<ShopProductListScreen> createState() => _ShopProductListScreenState();
}

class _ShopProductListScreenState extends State<ShopProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final productContainer = ProductContainer.of(context);
    final items = productContainer.items;
    return Scaffold(
        drawer: const DrawerMenu(),
        appBar: AppBar(
          title: const Text('Your Products'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                // using static router
                final result = await Navigator.pushNamed(
                    context, ShopProductUpdateScreen.routeName);
                debugPrint('$result');
                setState(() {
                  if (result != null) {
                    // items.sort((a, b) => b.name.compareTo(a.name));
                    productContainer.addProduct(result as ProductItem);
                  }
                });
              },
            ),
          ],
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final ProductItem item = items[index];
              return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image),
                  ),
                  title: Text(item.name),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.purple,
                        ),
                        onPressed: () async {
                          // using generate router
                          final result = await Navigator.pushNamed(
                            context,
                            ShopProductUpdateScreen.routeName,
                            arguments: item,
                          );
                          productContainer.updateProduct(result as ProductItem);
                        }),
                    IconButton(
                        icon: const Icon(
                          Icons.domain,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          // using dynamic router
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopProductUpdateScreen(
                                item: item,
                              ),
                            ),
                          );
                        }),
                    IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            productContainer.removeProduct(item);
                          });
                        }),
                  ]));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: items.length));
  }
}
