import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/badgee.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/utils/app_routes.dart';
import '../components/product_grid.dart';

enum FilterOptions { favorite, all }

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: FilterOptions.favorite,
                child: const Text('Somente Favoritos'),
              ),
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              )
            ],
            onSelected: (FilterOptions selectedValue) {
              switch (selectedValue) {
                case FilterOptions.favorite:
                  setState(() {
                    _showFavoriteOnly = true;
                  });
                  break;
                case FilterOptions.all:
                  setState(() {
                    _showFavoriteOnly = false;
                  });
                  break;
              }
            },
          ),
          // IconButton(
          //     onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
          Consumer<Cart>(
            builder: (ctx, cart, _) => Badgee(
              //color: Colors.black87,
              value: cart.itemsCount.toString(),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.cart);
                },
                icon: Icon(cart.itemsCount > 0
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined),
              ),
            ),
          )
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
      body: ProductGrid(
        showFavoriteOnly: _showFavoriteOnly,
      ),
    );
  }
}
