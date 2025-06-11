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
        
        primaryColor: const Color(0xFFE84393), 
        primarySwatch: Colors.pink, 

        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE84393),
            foregroundColor: Colors.white, 
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
