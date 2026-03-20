import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
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
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Minha Loja',
          theme: ThemeData(
            useMaterial3: false,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.pink,
              secondary: Colors.deepOrange,
            ),
            canvasColor: Colors.white,
            textTheme: ThemeData.light().textTheme.copyWith(
                  titleLarge: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                  ),
                ),
          ),
          home: ProductsOverviewPage(),
          routes: {
            AppRoutes.home: (ctx) => ProductsOverviewPage(),
            AppRoutes.productDetail: (ctx) => ProductDetailPage()
          }),
    );
  }
}
