import 'package:flutter/material.dart';
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
          // IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
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
