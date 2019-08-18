import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import './pages/productsAdmin.dart';
import './pages/home.dart';
import './pages/product.dart';
import './pages/auth.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    print("addProduct function called ");
    setState(() {
      print("setState called");
      _products.add(product);
    });
  }

  void _removeProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  Widget build(BuildContext context) {
    print("Material app build method");
    return new MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepPurple),
        //home: Auth(),
        routes: {
          '/': (BuildContext context) {
            return Auth();
          },
          '/products': (BuildContext context) {
            return Homepage(_products);
          },
          '/admin': (BuildContext context) {
            return ProductAdmin(_addProduct, _removeProduct);
          }
        },
        onGenerateRoute: (RouteSettings settings) {
          List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {  //before first / there's a empty string
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductDetail(
                  _products[index]['title'],
                  _products[index]['image'],
                  _products[index]['price'],
                  _products[index]['description']),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) {
            return Homepage(_products);
          });
        });
  }
}
