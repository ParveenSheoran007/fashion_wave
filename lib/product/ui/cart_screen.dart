import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  final List<String> cartItems = List.generate(10, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CartItem(
                item: cartItems[index],
                onDelete: () {
                  setState(() {
                    cartItems.removeAt(index);
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String item;
  final VoidCallback onDelete;

  const CartItem({
    Key? key,
    required this.item,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item),
          IconButton(
            icon: Icon(Icons.delete_forever),
            color: Colors.red,
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
