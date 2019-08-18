import 'package:flutter/material.dart';

class Productbutton extends StatelessWidget {
  final Function addProducts;
  Productbutton(this.addProducts);
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text("Add Products"),
      onPressed: () {
        print("onPressed called");
        addProducts({'title': 'Chocolate Sweets', 'image': 'assets/food.jpg'});
      },
    );
  }
}
