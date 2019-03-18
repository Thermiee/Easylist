import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pricetag.dart';
import './address_tag.dart';
import '../ui_elements/default_title.dart';
import '../../models/product.dart';
import '../../scoped-models/mainModel.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product.title),
          SizedBox(
            width: 6.0,
          ),
          PriceTag(product.price.toString())
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
                context,
                '/product/' + productIndex.toString(),
              ),
        ),
         ScopedModelDescendant<MainModel>
         (builder: (BuildContext context, Widget child, MainModel model){
           return IconButton(
          icon: Icon(model.allProducts[productIndex].isFavorite ? Icons.favorite : Icons.favorite_border),
          color: Colors.red,
          onPressed: () {
            model.selectProduct(productIndex);
            model.toggleProductFavoriteStatus();
          }
              );
         },) 
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitlePriceRow(),
          SizedBox(height: 10.0,),
          AddressTag('Allen Avenue, Ikeja'),
          Text(product.userEmail),
          _buildActionButton(context)
        ],
      ),
    );
  }
}
