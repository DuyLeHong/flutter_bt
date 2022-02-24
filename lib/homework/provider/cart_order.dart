import 'package:flutter/material.dart';
import 'package:flutterdemo/homework/model/product_item.dart';

final List<ProductItem> orderProductsList = [];

class _CardOrderInheritedWidget extends InheritedWidget {
  final _CartOrderContainerState data;

  const _CardOrderInheritedWidget(
      {Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class CartOrderContainer extends StatefulWidget {
  const CartOrderContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static _CartOrderContainerState of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_CardOrderInheritedWidget>())!
        .data;
  }

  @override
  _CartOrderContainerState createState() => _CartOrderContainerState();
}

class _CartOrderContainerState extends State<CartOrderContainer> {
  final List<ProductItem> _items = orderProductsList;

  List<ProductItem> get cartItems => _items;

  double get totalPrice {
    double total = 0;

    for (var element in _items) {
      total += element.price * element.quantity;
    }
    return total;
  }

  void addToCart(ProductItem orderProduct) {
    setState(() {
      final productIndex = _items.indexWhere((e) => e.id == orderProduct.id);
      print(orderProduct.name);
      if (productIndex < 0) {
        _items.add(orderProduct);
      } else {
        _items[productIndex] =
            orderProduct.copyWith(quantity: _items[productIndex].quantity + 1);
      }
    });
  }

  void degreeProd(ProductItem orderProduct) {
    setState(() {
      final productIndex = _items.indexWhere((e) => e.id == orderProduct.id);
      if (_items[productIndex].quantity > 1) {
        _items[productIndex] =
            orderProduct.copyWith(quantity: _items[productIndex].quantity - 1);
      } else {
        _items.removeAt(productIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CardOrderInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}
