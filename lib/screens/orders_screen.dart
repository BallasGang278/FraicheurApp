// Exemple pour OrdersScreen (adaptez pour DashboardScreen et PresentationScreen)
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des Commandes'),
        backgroundColor: const Color(0xFFE84393), // Couleur de votre barre d'application
      ),
      body: const Center(
        child: Text('Contenu de la page Commandes à venir.'),
      ),
    );
  }
}