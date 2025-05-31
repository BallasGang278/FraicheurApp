// lib/services/product_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_e5/models/product.dart'; // Assurez-vous que le chemin est correct

class ProductService {
  static const String _baseUrl = 'http://localhost/fraicheur/api'; // <-- POUR CHROME

  Future<bool> authenticateAdmin(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth.php'),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['success'] == true; // Assurez-vous que votre auth.php renvoie bien {"success": true/false}
    } else {
      print('Échec de l\'authentification: ${response.statusCode}, Corps: ${response.body}');
      return false;
    }
  }

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products.php'));
    if (response.statusCode == 200) {
      final List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Échec du chargement des produits: ${response.statusCode}');
    }
  }
}