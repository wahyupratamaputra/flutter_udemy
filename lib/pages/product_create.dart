import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titlevalue;
  String _description;
  double _pricevalue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is required';
        }
      },
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        setState(() {
          _titlevalue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is required';
        }
      },
      decoration: InputDecoration(labelText: 'Product Description'),
      onSaved: (String value) {
        setState(() {
          _description = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          _pricevalue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    _formKey.currentState.save();
    if(!_formKey.currentState.validate()){
      return;
    }
    
    final Map<String, dynamic> product = {
      'title': _titlevalue,
      'description': _description,
      'price': _pricevalue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth =
        deviceWidth > 600 ? 500 : MediaQuery.of(context).size.width * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
      margin: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceTextField(),
            SizedBox(
              height: 20,
            ),
            // RaisedButton(
            //     child: Text('Add'),
            //     color: Theme.of(context).accentColor,
            //     textColor: Colors.white,
            //     onPressed: _submitForm)
            RaisedButton(
              color: Colors.green,
              child: Text('Save'),
              textColor: Colors.white,
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
