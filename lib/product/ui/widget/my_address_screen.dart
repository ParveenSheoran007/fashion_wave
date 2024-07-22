import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  String name = '';
  String address = '';
  List<String> products = [];
  String orderDate = '';
  String orderTime = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      address = prefs.getString('address') ?? '';
      products = prefs.getStringList('products') ?? [];
      orderDate = prefs.getString('orderDate') ?? '';
      orderTime = prefs.getString('orderTime') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text(
          'Order Details',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInfoCard('Name', name),
              const SizedBox(height: 8),
              buildInfoCard('Address', address),
              const SizedBox(height: 16),
              Text(
                'Products:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              ...products.map((product) => buildProductTile(product)).toList(),
              const SizedBox(height: 16),
              buildInfoCard('Order Date', orderDate),
              const SizedBox(height: 8),
              buildInfoCard('Order Time', orderTime),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, String info) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              '$title: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            Expanded(
              child: Text(
                info,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductTile(String product) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(product),
      ),
    );
  }
}
