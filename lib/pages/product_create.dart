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
  String _name = " ", _description = " ";
  double _price;

  Widget _createInputTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Name',
      ),
      onChanged: (String value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createDescriptionField() {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        labelText: 'Description',
      ),
      onChanged: (String value) {
        setState(() {
          _description = value;
        });
      },
    );
  }

  Widget _createPriceInputField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'price',
      ),
      onChanged: (String value) {
        setState(() {
          _price = double.parse(value);
        });
      },
    );
  }

  void _saveData() {
    final Map<String, dynamic> product = {
      'title': _name,
      'description': _description,
      'price': _price,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(
        product); //calling the parent widgets method whose stateclass it's being executed in
    Navigator.pushReplacementNamed(context, 'products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return Container(
      /* List View takes full available width so we set padding to the container */
      padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          _createInputTextField(),
          _createDescriptionField(),
          _createPriceInputField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text("SAVE"),
            onPressed:
                _saveData, // pass only the reference so that flutter will execute it when pressed.
          ),
        ],
      ),
    );
  }
}
