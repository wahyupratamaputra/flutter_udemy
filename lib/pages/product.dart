import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl, this.price, this.description);

  Widget _buildAddressPriceRow() {
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
            title,
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                child: TitleDefault(title),
                padding: EdgeInsets.all(10),
              ),
              _buildAddressPriceRow(),
              Container(
                child: Text(
                  description,
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
