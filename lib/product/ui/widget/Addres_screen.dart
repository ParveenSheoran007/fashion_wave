import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white70),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: 'City/Village',
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Card(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white70),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: 'PinCode',
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Card(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white70),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: 'HouseNo',
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                  child: Text(
                'Continous',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}
