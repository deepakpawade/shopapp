import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
 final Function _changeTheme;
 bool darkMode;
  Settings(this._changeTheme,this.darkMode);

  @override
  State createState() => _SettingState();
}

Widget _drawer(BuildContext context){
   return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('choose'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("All Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Manage Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
        ],
      ),
    );
}


class _SettingState extends State<Settings> {
bool darkOn = false;
@override
  void initState() {
    darkOn = widget.darkMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          SwitchListTile(
                      value: darkOn,
                      title: const Text('Apply dark theme ?'),
                      onChanged: (bool dark) {
                        setState(() {
                          darkOn = dark;
                          widget._changeTheme(darkOn);
                        });
                      })
        ],
      ),
    );
  }
}
