import 'package:flutter/material.dart';

import '../Widgets/ui_elements/title.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String imageURL;
  final double price;
  final String description;

  ProductDetail(this.title, this.imageURL, this.price, this.description);

  // _showWarningDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Are you sure ?"),
  //           content: Text("This action cannot be undone!"),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text("Discard"),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             FlatButton(
  //               child: Text("Continue"),
  //               onPressed: () {
  //                 Navigator.pop(context);  //close the dialog box
  //                 Navigator.pop(context, true); //delete the page
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  Widget _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, San Francisco',
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          '\$' + price.toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //control what happens when we click default back arrow or back Softkey (coz they return null)
      //bcoz pop returns null and not a bool value. So to fix it we need to assume control.
      //the bool value is the future for when we want to delete the product
      //the products page expects an bool which confirms whether to delete the product or not,
      // it should get only bool as future.
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(
            false); // works without it but on previous versions it was required to return a Future
        //if false it won't allow to go back . First we pop productDetail page and
        //then we pass the productsPage futute to the context. False: so it won't try to pop the products page.
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageURL),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleText(title),
            ),
            _buildAddressPriceRow(),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
