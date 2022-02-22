import 'package:flutter/material.dart';
import 'package:flutterdemo/homework/lesson8/Product.dart';
import 'package:flutterdemo/homework/lesson8/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          title: Text("My shop"),
          backgroundColor: const Color(0xFF9C27B0),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: ListProduct(),
      ),
    );
  }
}

final List<Product> listProduct = [
  Product(
      "Quần jean",
      "https://cdn.shopify.com/s/files/1/0268/7841/0824/products/1053SS-white_1900x_crop_center_141b7f52-8fcb-4127-8025-3a27fcb314e8_720x.jpg?v=1618506001",
      "\$5.6",
      false),
  Product(
      "Áo kitty",
      "https://i.ebayimg.com/images/g/scAAAOSw10tgkxBI/s-l300.jpg",
      "\$9.8",
      false),
  Product(
      "Quần ống",
      "https://ae01.alicdn.com/kf/Hea036cc6bf16445195bdbd0baabaf6ccx/Gowyimmes-M-a-ng-2021-Size-L-n-S-5XL-R-ng-Cho-S-n-Vi.jpg_Q90.jpg_.webp",
      "\$5.4",
      false),
];

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          for (int i = 0; i < listProduct.length; i++)
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => ProductDetail(listProduct[i])));
              }, // Handle your callback
              child: ProductItem(
                product: listProduct[i],
              ),
            )
        ]);
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState(product);
}

class _ProductItemState extends State<ProductItem> {
  final Product product;

  _ProductItemState(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              product.image,
              height: 300.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0))),
            height: 50,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    product.favorite ? Icons.favorite : Icons.favorite_border,
                    color: Color(0xFF9F28B4),
                  ),
                  onPressed: () {
                    setState(() {
                      product.favorite = !product.favorite;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                  ),
                  flex: 1,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color(0xFF9F28B4),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
