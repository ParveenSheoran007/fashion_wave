import 'dart:async';

import 'package:fashion_wave/product/provider/product_provider.dart';
import 'package:fashion_wave/product/ui/view_all-product_list_screen.dart';

import 'package:fashion_wave/product/ui/widget/custtom_buttom_bar.dart';
import 'package:fashion_wave/shared/color_const.dart';
import 'package:fashion_wave/shared/string_const_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fashion_wave/product/ui/product_detail_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            if (productProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    child: PageView(
                      controller: pageController,
                      children: [
                        Image.network(
                          'https://img.freepik.com/free-psd/sales-banner-template-with-image_23-2148149654.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Image.network(
                          'https://www.slideteam.net/media/catalog/product/cache/1280x720/f/a/fashion_company_profile_powerpoint_presentation_slides_cp_cd_slide01.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2WihTvUQzM__DJhKKmGyzN7lDAnuSCDM1ua3rr5cRES0g-CQz-0XtkjGydAZQqUokAZU&usqp=CAU',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstText.popularText,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ViewAllProductListScreen(),
                              ),
                            );
                          },
                          child: Text(
                            StringConstText.vielAll,
                            style: const TextStyle(
                              color: ColorConst.buttonColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: productProvider.products.length,
                          itemBuilder: (context, index) {
                            final product = productProvider.products[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                      productId: product.id.toString(),
                                    ),
                                  ),
                                );
                                productProvider.incrementCount(product);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '\Rs${product.price}',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Clicks: ${product.clickCount}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        productProvider.favoriteProducts
                                                .contains(product)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (productProvider.favoriteProducts
                                              .contains(product)) {
                                            productProvider
                                                .removeFavorite(product);
                                          } else {
                                            productProvider
                                                .addFavorite(product);
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
