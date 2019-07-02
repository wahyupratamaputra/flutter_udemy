import 'package:first_app/pages/product.dart';
import 'package:first_app/product_manager.dart';
import 'package:flutter/material.dart';
import './pages/auth.dart';
import './pages/product_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProducts(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) => ProductsPage(_products),
          '/admin': (BuildContext context) => ProductAdminPage(_addProducts, _deleteProduct),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split(
              '/'); //product/1/ remove the slash make to list "product" "list"
          if (pathElements[0] != "") {
            return null;
          }
          if (pathElements[1] == "product") {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                    _products[index]['title'],
                    _products[index]['image'],
                  ),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsPage(_products),
          );
        });
  }
}
