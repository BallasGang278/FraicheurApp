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
        backgroundColor: const Color(0xFFE84393), // <-- Ta couleur
        centerTitle: true,
        // La flèche de retour sera automatiquement gérée si cet écran est poussé sur la pile.
        // Étant donné qu'il fait partie de la BottomNavigationBar, il n'aura pas de flèche de retour par défaut
        // sauf si tu y navigues depuis une autre page que la RootScreen.
      ),
      body: SingleChildScrollView( // Pour défiler si le contenu est trop grand
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Carte pour les commandes en attente
            _buildInfoCard(
              context,
              icon: Icons.pending_actions,
              title: 'Commandes en attente',
              value: '12', // Remplacez par la donnée réelle de votre API
              color: Colors.orange,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersScreen()));
              },
            ),
            const SizedBox(height: 16.0),
            // Carte pour les produits en stock faible
            _buildInfoCard(
              context,
              icon: Icons.inventory_2,
              title: 'Produits en stock faible',
              value: '5', // Remplacez par la donnée réelle
              color: Colors.red,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductListScreen()));
              },
            ),
            const SizedBox(height: 16.0),
            // Carte pour le chiffre d'affaires
            _buildInfoCard(
              context,
              icon: Icons.attach_money,
              title: 'Chiffre d\'affaires (ce mois)',
              value: '12 500 €', // Remplacez par la donnée réelle
              color: Theme.of(context).colorScheme.primary, // Couleur principale
            ),
            const SizedBox(height: 16.0),
            // Section pour les derniers produits ajoutés ou autres statistiques
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
                    // Placeholder pour une liste de produits
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
                    // ... ajouter plus de listTiles
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
    return InkWell( // Rend la carte cliquable
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Card(
        color: color.withOpacity(0.1), // Légèrement teinté
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