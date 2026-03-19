import 'package:flutter/material.dart';
import '../components/product_grid.dart';

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: const Drawer(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Text('futuro'),
            ],
          ),
        ),
      ),
      body: ProductGrid(),
    );
  }
}
