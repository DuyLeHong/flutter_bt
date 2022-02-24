import 'package:flutter/material.dart';
import 'package:flutterdemo/homework/provider/cart_order.dart';

class CartOrderScreen extends StatelessWidget {
  static const routeName = 'cart-order-products';
  const CartOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = CartOrderContainer.of(context).cartItems;
    final totalPrice = CartOrderContainer.of(context).totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            '\$$totalPrice',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        ElevatedButton(
                          child: const Text(
                            'ORDER NOW',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            '\$${cartItems[index].price.toString()}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItems[index].name,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Total: \$' +
                                    (cartItems[index].price *
                                            cartItems[index].quantity)
                                        .toString(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    CartOrderContainer.of(context).degreeProd(
                                      cartItems[index],
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                              const SizedBox(width: 5),
                              Text(
                                'x' + cartItems[index].quantity.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 5),
                              IconButton(
                                  onPressed: () {
                                    CartOrderContainer.of(context).addToCart(
                                      cartItems[index],
                                    );
                                  },
                                  icon: const Icon(Icons.add,
                                      color: Colors.blue)),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
