// lib/screens/presentation_screen.dart
import 'package:flutter/material.dart';
import 'root_screen.dart'; 

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
                'asset/accueil.jpg', 
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
            
            Align( 
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 150), 
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    // Phrase de bienvenue
                    const Text(
                      'Bienvenue, Administrateur !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [ 
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(150, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20), 
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
