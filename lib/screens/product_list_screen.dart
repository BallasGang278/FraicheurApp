// lib/screens/product_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_e5/services/product_service.dart';
import 'package:flutter_application_e5/models/product.dart';
import 'package:flutter_application_e5/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> _productsFuture;
  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    _productsFuture = _productService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion du Catalogue'),
        backgroundColor: const Color(0xFFE84393), 
        centerTitle: true,
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFE84393))); 
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun produit trouvé.'));
          } else {
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Nombre de colonnes
                crossAxisSpacing: 10.0, // Espace horizontal entre les cartes
                mainAxisSpacing: 10.0, // Espace vertical entre les cartes
                childAspectRatio: 0.75, // Ratio largeur/hauteur des cartes
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ProductItem(
                  product: product,
                  onEdit: () {
                    
                  },
                  onDelete: () {
                    
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: const Color(0xFFE84393), 
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
