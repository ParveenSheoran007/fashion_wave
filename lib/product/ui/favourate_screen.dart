import 'package:fashion_wave/shared/color_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fashion_wave/product/provider/product_provider.dart';
import 'package:fashion_wave/product/ui/product_detail_screen.dart';

class FavourateScreen extends StatefulWidget {
  const FavourateScreen({super.key});

  @override
  State<FavourateScreen> createState() => FavourateScreenState();
}

class FavourateScreenState extends State<FavourateScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: ColorConst.BackGroundColor,
      appBar: AppBar(
          backgroundColor: ColorConst.appBarColor,
        title: const Text('Favorite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: productProvider.favoriteProducts.isEmpty
            ? const Center(child: Text('No favorites yet'))
            : ListView.builder(
          itemCount: productProvider.favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = productProvider.favoriteProducts[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorConst.containerColor),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  productId: product.id.toString(),
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Price: \Rs${product.price}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Description: ${product.description}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            productProvider.removeFavorite(product);
                          });
                        },
                      ),
                    ],
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
