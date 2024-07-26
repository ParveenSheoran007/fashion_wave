import 'package:fashion_wave/shared/string_const_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => MyOrderScreenState();
}

class MyOrderScreenState extends State<MyOrderScreen> {
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
        title:  Text(
            StringConstText.orderDetail,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfoRow( StringConstText.name, name),
                const SizedBox(height: 8),
                buildInfoRow( StringConstText.address, address),
                const SizedBox(height: 16),
                ...products.map((product) => buildProductRow(product)).toList(),
                buildInfoRow( StringConstText.orderDate, orderDate),
                const SizedBox(height: 8),
                buildInfoRow( StringConstText.orderTime, orderTime),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String info) {
    return Row(
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
    );
  }

  Widget buildProductRow(String product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        product,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
