import 'package:fashion_wave/product/ui/widget/my_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fashion_wave/product/provider/product_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final paymentMethodController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    paymentMethodController.dispose();
    super.dispose();
  }

  Future<void> saveUserData(List<String> products) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);

    await prefs.setString('name', nameController.text);
    await prefs.setString('address', addressController.text);
    await prefs.setStringList('products', products);
    await prefs.setString('orderDate', formattedDate);
    await prefs.setString('orderTime', formattedTime);
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartItems = productProvider.cartItems;

    double totalPrice = cartItems.fold(
        0, (sum, item) => sum + (item.product.price * item.quantity));

    List<String> products = cartItems
        .map((item) =>
            '${item.product.name}: \$${(item.product.price * item.quantity).toStringAsFixed(2)} (Qty: ${item.quantity})')
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.grey.shade100,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Summary',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return ListTile(
                      title: Text(cartItem.product.name),
                      subtitle: Text('Quantity: ${cartItem.quantity}'),
                      trailing: Text(
                          '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
              ),
              const SizedBox(height: 16),
              Text(
                'Shipping Information',
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Payment Method',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: paymentMethodController,
                decoration: const InputDecoration(
                  labelText: 'Payment Method',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        addressController.text.isEmpty ||
                        paymentMethodController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Incomplete Information'),
                          content: const Text(
                              'Please fill in all the fields before proceeding.'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      await saveUserData(products);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Checkout'),
                          content: const Text('Order placed successfully!'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                productProvider.clearCart();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyOrderScreen()),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Place Order',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
