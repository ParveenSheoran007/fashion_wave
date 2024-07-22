import 'package:fashion_wave/product/ui/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => MyOrderScreenState();
}

class MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('My ORDERS'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            child: Icon(Icons.shopping_cart),
          ),
          SizedBox(width: 16),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Share.share('Check out my order details!');
              },
              child: Icon(Icons.share),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 190,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Order Detail',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text('Price Detail(1 item)'),
                    ),
                    const SizedBox(height: 6),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Total Price'), Text('+Rs 200')],
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Additional Charge'),
                          Text('+Rs 100'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: Divider(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Other Total'), Text('300')],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('Sumit'),
                      SizedBox(height: 6),
                      Text('Bhiwani,127201'),
                      SizedBox(height: 6),
                      Text('83075777780'),
                      SizedBox(height: 6),
                    ],
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
