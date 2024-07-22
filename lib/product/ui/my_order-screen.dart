import 'package:fashion_wave/shared/color_const.dart';
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

  bool get isUserDataComplete {
    return name.isNotEmpty &&
        address.isNotEmpty &&
        products.isNotEmpty &&
        orderDate.isNotEmpty &&
        orderTime.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.BackGroundColor,
      appBar: AppBar(
        backgroundColor: ColorConst.appBarColor,
        title: Text(
          StringConstText.orderDetail,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: isUserDataComplete
              ? Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: ColorConst.containerColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfoRow(StringConstText.name, name),
                const SizedBox(height: 8),
                buildInfoRow(StringConstText.address, address),
                const SizedBox(height: 16),
                ...products.map((product) => buildProductRow(product)).toList(),
                buildInfoRow(StringConstText.orderDate, orderDate),
                const SizedBox(height: 8),
                buildInfoRow(StringConstText.orderTime, orderTime),
              ],
            ),
          )
              : Center(
            child: Text(
              'Please fill out your details to view your order.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              textAlign: TextAlign.center,
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
