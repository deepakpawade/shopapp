import 'package:flutter/material.dart';
import '../Widgets/products/products.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Homepage(this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Choose"),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Manage Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_applications),
            title: Text("Settings"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text("Easylist"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Products(products: products),
    );
  }
}
