import 'package:flutter/material.dart';
import './product_create.dart';
import './product_list.dart';

class ProductAdmin extends StatelessWidget {
  final Function addProduct, removeProduct;
  ProductAdmin(this.addProduct, this.removeProduct);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Choose"),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("All Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text("Admin Page"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: "Create products",
              ),
              Tab(icon: Icon(Icons.list), text: "My products")
            ],
          ),
        ),
        body: Center(
            child: TabBarView(
          children: <Widget>[ProductCreatePage(addProduct), ProductListPage()],
        )),
      ),
    );
  }
}
