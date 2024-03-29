import "package:flutter/material.dart";
import './price_tag.dart';
import '../ui_elements/title.dart';
import 'address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;
  ProductCard(this.product, this.index);

  Widget _buildTitlePriceRow() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleText(product['title']),
            SizedBox(
              width: 7.0,
            ),
            PriceTag(product['price'].toString()),
          ],
        ));
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.pushNamed<bool>(context, '/product/' + index.toString());
          },
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: () {
            Navigator.pushNamed<bool>(context, '/product/' + index.toString());
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          _buildTitlePriceRow(),
          AddressTag("Wellington,New Zealand"),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
