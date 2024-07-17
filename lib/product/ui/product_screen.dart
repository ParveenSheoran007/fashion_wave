import 'package:fashion_wave/product/ui/widget/custtom_buttom_bar.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                child: PageView(
                  controller:  pageController,
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
                    const Text(
                      'Popular',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.red,
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
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                             border: Border.all(color:Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(14)),
                          child: Icon(Icons.favorite_outline,color: Colors.grey,),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}