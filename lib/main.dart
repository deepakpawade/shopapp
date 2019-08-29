import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import './pages/productsAdmin.dart';
import './pages/home.dart';
import './pages/product.dart';
import './pages/auth.dart';
import './pages/settings.dart';

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
  Brightness brightness;
  bool _darkmode;
  @override
  void initState() {
    _darkmode = false;
    super.initState();
  }

  void _changeTheme(bool dark) {
    setState(() {
      brightness = (dark == true) ? Brightness.dark : Brightness.light;
      _darkmode = (dark == true) ? true: false;
    });
  }

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
          brightness: brightness,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.deepPurple,
            textTheme: ButtonTextTheme.primary,
          ),

          // buttonColor: Colors.deepPurple,
          // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
        ),
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
          },
          '/settings': (BuildContext context) {
            return Settings(_changeTheme,_darkmode);
          },
        },
        onGenerateRoute: (RouteSettings settings) {
          List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            //before first / there's a empty string
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
