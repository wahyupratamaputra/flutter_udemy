import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Are You Sure ?'),
              content: Text('This Action cannot be undone'),
              actions: <Widget>[
                FlatButton(
                  child: Text("CONTINUE"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  },
                ),
                FlatButton(
                  child: Text("DISCARD"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]);
        });
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
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                child: Text('detail !'),
                padding: EdgeInsets.all(10),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('DELETE'),
                onPressed: () => _showWarningDialog(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
