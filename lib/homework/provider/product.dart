import 'package:flutter/material.dart';
import 'package:flutterdemo/homework/model/product_item.dart';

final List<ProductItem> productItems = <ProductItem>[
  ProductItem(
      id: '1',
      name: 'Product 1',
      price: 100,
      quantity: 1,
      image:
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      description: 'Ok'),
  ProductItem(
      id: '2',
      name: 'Product 2',
      price: 100,
      quantity: 1,
      image:
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      description: 'Ok'),
];

class ProductContainer extends StatefulWidget {
  final Widget child;
  const ProductContainer({Key? key, required this.child}) : super(key: key);

  static _ProductContainerState of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_ProductInheritedWidget>())!
        .data;
  }

  @override
  _ProductContainerState createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  final List<ProductItem> _items = productItems; // init default product items

  List<ProductItem> get items => _items;

  void addProduct(ProductItem productItem) {
    setState(() {
      _items.add(productItem);
    });
  }

  void removeProduct(ProductItem productItem) {
    setState(() {
      _items.removeWhere((element) => productItem.id == element.id);
    });
  }

  void updateProduct(ProductItem productItem) {
    setState(() {
      final index =
          _items.indexWhere((element) => productItem.id == element.id);
      _items[index] = productItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ProductInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _ProductInheritedWidget extends InheritedWidget {
  final _ProductContainerState data;

  const _ProductInheritedWidget(
      {Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
