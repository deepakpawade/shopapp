import 'package:flutter/material.dart';
import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Products({this.products});

  @override
  Widget build(BuildContext context) {
    print("products build method");
    return _productsChecker();
  }

  Widget _productsChecker() { 
    Widget product;
    if (products.length > 0) {
      product = ListView.builder(
        itemBuilder: (BuildContext context,int index){
          return ProductCard(products[index], index);
        },
        itemCount: products.length,
      );
    } else {
      product = Center(
        child: Text("NO PRODUCTS FOUND! PLEASE ADD SOME"),
      );
    }
    return product;
  }
   
}


