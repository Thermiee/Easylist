import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/ui_elements/default_title.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/mainModel.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Allen Avenue'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          '\#' + price.toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button Pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        final Product product = model.allProducts[productIndex];
        return Scaffold(
          appBar: AppBar(title: Text(product.title)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(product.image),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TitleDefault(product.title),
              ),
              _buildAddressPriceRow(product.price),
              // Container(
              //   padding: EdgeInsets.all(20.0),
              //   child: RaisedButton(
              //     color: Theme.of(context).accentColor,
              //     child: Text('DELETE'),
              //     onPressed: () => _showWarningDialog(context),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  product.description,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
// _showWarningDialog(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Are you sure'),
//             content: Text('This action cannot be undone'),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('DISCARD'),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               FlatButton(
//                 child: Text('CONTINUE'),
//                 onPressed: () {
//                   Navigator.pop(context);
//                   Navigator.pop(context, true);
//                 },
//               )
//             ],
//           );
//         }
//         );
//   }
