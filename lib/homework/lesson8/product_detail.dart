import 'package:flutter/material.dart';
import 'package:flutterdemo/homework/lesson8/Product.dart';

class ProductDetail extends StatelessWidget {
  Product product;

  ProductDetail(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.network(
                    product.image,
                    height: 500,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  Positioned(
                      bottom: 24,
                      left: 24,
                      child: Text(
                        product.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                product.price,
                style: const TextStyle(color: Colors.black, fontSize: 50),
              )
            ],
          ),
        ));
  }
}
