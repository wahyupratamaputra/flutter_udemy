import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/products.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;
  ProductPage(this.productIndex);

  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Union Style of Indonesia'),
        Container(
          child: Text('|'),
          margin: EdgeInsets.symmetric(horizontal: 5),
        ),
        Text('\$' + price.toString()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      print('back button pressed');
      Navigator.pop(context, false);

      return Future.value(false);
    }, child: ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        final Product product = model.products[productIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(
              product.title,
            ),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Image.asset(product.image),
                Container(
                  child: TitleDefault(product.title),
                  padding: EdgeInsets.all(10),
                ),
                _buildAddressPriceRow(product.price),
                Container(
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.all(15),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
