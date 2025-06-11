// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'orders_screen.dart'; // Pour la navigation vers les commandes
import 'product_list_screen.dart'; // Pour la navigation vers les produits

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de Bord'),
        backgroundColor: const Color(0xFFE84393), 
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInfoCard(
              context,
              icon: Icons.pending_actions,
              title: 'Commandes en attente',
              value: '12', 
              color: Colors.orange,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersScreen()));
              },
            ),
            const SizedBox(height: 16.0),
            _buildInfoCard(
              context,
              icon: Icons.inventory_2,
              title: 'Produits en stock faible',
              value: '5', 
              color: Colors.red,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductListScreen()));
              },
            ),
            const SizedBox(height: 16.0),
            
            _buildInfoCard(
              context,
              icon: Icons.attach_money,
              title: 'Chiffre d\'affaires (ce mois)',
              value: '12 500 €',
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16.0),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Derniers produits ajoutés',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8.0),

                    ListTile(
                      leading: const Icon(Icons.star),
                      title: const Text('Produit A'),
                      subtitle: const Text('2 jours, 15€'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: const Text('Produit B'),
                      subtitle: const Text('5 jours, 25€'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    VoidCallback? onTap,
  }) {
    return InkWell( 
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Card(
        color: color.withOpacity(0.1), 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40.0, color: color),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              if (onTap != null) const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
