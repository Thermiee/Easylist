import 'package:flutter/material.dart';
import './productscard.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/mainModel.dart';
import '../../models/product.dart';

class Products extends StatelessWidget {

  Widget _buildProductLists(List<Product> products) {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text('No product Found, Please add some'),
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){
      return _buildProductLists(model.displayedProducts);
    },);
  }
}
