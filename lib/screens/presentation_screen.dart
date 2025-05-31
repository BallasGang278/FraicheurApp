// lib/screens/presentation_screen.dart
import 'package:flutter/material.dart';
import 'root_screen.dart'; // Importez le RootScreen

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Image de fond
            Positioned.fill(
              child: Image.asset(
                'asset/accueil.jpg', // Assure-toi que le nom est bon (jpg ou png)
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      'Erreur de chargement de l\'image de fond.\nVérifiez le chemin "asset/accueil.jpg" dans pubspec.yaml.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );
                },
              ),
            ),
            // Contenu (texte et bouton) superposé
            Align( // Utilise Align pour un positionnement précis de l'ensemble
              alignment: Alignment.topCenter, // Aligne en haut au centre
              child: Padding(
                padding: const EdgeInsets.only(top: 150), // Descend le contenu de 150 pixels du haut (ajuste cette valeur)
                child: Column(
                  mainAxisSize: MainAxisSize.min, // La colonne prend juste l'espace nécessaire
                  children: [
                    // Phrase de bienvenue
                    const Text(
                      'Bienvenue, Administrateur !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, // Couleur du texte pour qu'il ressorte sur l'image
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [ // Petite ombre pour améliorer la lisibilité
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(150, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20), // Espace entre le texte et le bouton
                    // Bouton "Démarrer l'administration"
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const RootScreen()),
                        );
                      },
                      child: const Text('Démarrer l\'administration'),
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
}