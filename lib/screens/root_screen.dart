// lib/screens/root_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_e5/screens/product_list_screen.dart';
import 'package:flutter_application_e5/screens/orders_screen.dart';
import 'package:flutter_application_e5/screens/dashboard_screen.dart';
import 'package:flutter_application_e5/screens/presentation_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const ProductListScreen(),    // Index 0 : Catalogue
    const OrdersScreen(),         // Index 1 : Commandes
    const DashboardScreen(),      // Index 2 : Tableau de bord
    const PresentationScreen(),   // Index 3 : Site Web
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Catalogue'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Commandes'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Tableau de bord'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Site Web'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFE84393),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}