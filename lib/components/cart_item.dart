import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({required this.cartItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsetsGeometry.all(5),
              child: FittedBox(
                child: Text('${cartItem.price.toStringAsFixed(2)}'),
              ),
            ),
          ),
          title: Text(cartItem.name),
          subtitle: Text(
              "Total: R\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}"),
          trailing: Text("${cartItem.quantity}x"),
        ),
      ),
    );
  }
}
