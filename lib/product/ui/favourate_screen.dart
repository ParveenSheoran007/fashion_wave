import 'package:flutter/material.dart';

class FavourateScreen extends StatefulWidget {
  const FavourateScreen({super.key});

  @override
  State<FavourateScreen> createState() => FavourateScreenState();
}

class FavourateScreenState extends State<FavourateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('Favorite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(''),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
