import 'package:delivery/pages/cart_page.dart';
import 'package:delivery/pages/menu_page.dart';
import 'package:delivery/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final bodies = [MenuPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delivery')),
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white38,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Menu'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Cart'),
          ),
        ],
        onTap: (value) => setState(() => currentIndex = value),
      ),
      body: bodies[currentIndex],
    );
  }
}
