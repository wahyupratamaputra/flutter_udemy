import 'package:first_app/pages/product.dart';
import 'package:first_app/scoped-models/main.dart';
import 'package:flutter/material.dart';
import './pages/auth.dart';
import './pages/product_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import 'package:scoped_model/scoped_model.dart';
import './models/product.dart';

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
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
          theme:
              ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Josep'),
          routes: {
            '/': (BuildContext context) => AuthPage(),
            '/products': (BuildContext context) => ProductsPage(model),
            '/admin': (BuildContext context) => ProductAdminPage(model),
          },
          onGenerateRoute: (RouteSettings settings) {
            final List<String> pathElements = settings.name.split(
                '/'); //product/1/ remove the slash make to list "product" "list"
            if (pathElements[0] != "") {
              return null;
            }
            if (pathElements[1] == "product") {
              final String productId = pathElements[2];
              final Product product = model.allProducts.firstWhere((Product product){
                return product.id == productId;
              });
              return MaterialPageRoute<bool>(
                builder: (BuildContext context) =>
                    ProductPage(product),
              );
            }
            return null;
          },
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage(model),
            );
          }),
    );
  }
}
