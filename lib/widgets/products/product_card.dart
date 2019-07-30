import 'package:flutter/material.dart';
import './price_tag.dart';
import './address_tag.dart';
import '../ui_elements/title_default.dart';
import '../../models/product.dart';
import '../../scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TitleDefault(product.title),
        SizedBox(
          width: 8,
        ),
        PriceTag(product.price.toString())
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
            context,
            '/product/' + model.allProducts[productIndex].id,
          ),
        ),
        IconButton(
          icon: Icon(model.allProducts[productIndex].isFavorite
              ? Icons.favorite
              : Icons.favorite_border),
          color: Colors.redAccent,
          onPressed: () {
            model.selectProduct(model.allProducts[productIndex].id);
            model.toggleProductFavoriteStatus();
          },
        )
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(product.image),
            placeholder: AssetImage('assets/loading.gif'),
          ),
          SizedBox(
            height: 20,
          ),
          _buildTitlePriceRow(),
          AddressTag('Union Bali, Indonesia Square'),
          Text(product.userEmail),
          _buildActionButton(context),
        ],
      ),
    );
  }
}
