// lib/widgets/product_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_e5/models/product.dart'; 

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductItem({
    Key? key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
              
              child: Image.network(
                product.imageUrl, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  
                  return Container(
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.broken_image,
                      size: 50.0,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.designation,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                
                Text(
                  '${product.price.toStringAsFixed(2)} €', 
                  style: TextStyle(
                    fontSize: 14,
                    color: product.reduction > 0 ? Colors.grey : Colors.black,
                    decoration: product.reduction > 0 ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
               
                if (product.reduction > 0)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '${(product.price * (1 - product.reduction / 100)).toStringAsFixed(2)} €',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                
                if (product.reduction > 0)
                  Text(
                    '-${product.reduction.toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
