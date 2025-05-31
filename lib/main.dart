// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_e5/screens/login_screen.dart';
import 'package:flutter_application_e5/screens/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fraicheur Admin App',
      theme: ThemeData(
        // Couleur principale de ton thème (pour les éléments Material Design par défaut)
        primaryColor: const Color(0xFFE84393), // Ta couleur personnalisée
        // primarySwatch est souvent utilisé pour générer des nuances,
        // mais primaryColor/accentColor sont plus directs pour ta couleur exacte.
        // On peut laisser primarySwatch en rose ou le supprimer si tu ne veux que ta couleur.
        // Colors.pink est un exemple, si tu n'utilises pas ses nuances, tu peux le laisser ou le retirer.
        primarySwatch: Colors.pink, 

        // Définit la couleur de fond par défaut pour les ElevatedButtons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE84393), // Couleur de fond du bouton
            foregroundColor: Colors.white, // Couleur du texte du bouton
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/root': (context) => const RootScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}