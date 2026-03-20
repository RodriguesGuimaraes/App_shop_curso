import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // forma de adicionar orientação unica de tela
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then((_) => runApp(Shop()));
}

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Minha Loja',
          theme: ThemeData(
            useMaterial3: false,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.purple,
              secondary: Colors.deepOrange,
            ),
            canvasColor: Colors.white,
            textTheme: ThemeData.light().textTheme.copyWith(
                  titleLarge: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Lato',
                  ),
                ),
          ),
          routes: {
            AppRoutes.home: (ctx) => ProductsOverviewPage(),
            AppRoutes.productDetail: (ctx) => ProductDetailPage(),
            AppRoutes.cart: (ctx) => CartPage(),
            AppRoutes.orders: (ctx) => OrdersPage()
          }),
    );
  }
}
