import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: FlutterLogo(
                colors: Colors.amber,
                style: FlutterLogoStyle.stacked,
                size: 55,
              ),
            ),
            accountName: Text('Delivery'),
            accountEmail: Text('Username'),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Delivery', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
