import 'package:fashion_wave/product/model/product_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final VoidCallback onDelete;

  const CartItem({
    required this.product,
    required this.quantity,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        // leading: ClipRRect(
        //   borderRadius: BorderRadius.circular(8),
        //   child: Image.network(
        //     product.imageUrl,
        //     fit: BoxFit.cover,
        //     width: 80,
        //     height: 80,
        //   ),
        // ),
        title: Text(
          product.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '\$${(product.price * quantity).toStringAsFixed(2)} x $quantity',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: onDelete,
          color: Colors.red,
        ),
      ),
    );
  }
}
