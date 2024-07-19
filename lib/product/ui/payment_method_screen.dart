import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => PaymentMethodScreenState();
}

class PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                buildPaymentOption('Cash on Delivery', 'cod'),
                buildPaymentOption('Online Payment', 'online'),
                buildPaymentOption('Card', 'card'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(String title, String value) {
    return ListTile(
      title: Text(title),
      trailing: Radio<String>(
        value: value,
        groupValue: selectedPaymentMethod,
        activeColor: Colors.red,
        onChanged: (String? newValue) {
          setState(() {
            selectedPaymentMethod = newValue;
          });
        },
      ),
    );
  }
}
