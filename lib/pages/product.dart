import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage(this.product);

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
    return WillPopScope(
      onWillPop: () {
        print('back button pressed');
        Navigator.pop(context, false);

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            product.title,
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              FadeInImage(
                image: NetworkImage(product.image),
                placeholder: AssetImage('assets/loading.gif'),
              ),
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
      ),
    );
  }
}
