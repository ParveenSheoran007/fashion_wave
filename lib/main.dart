import 'package:flutter/material.dart';
import 'package:fashion_wave/auth/ui/login_screen.dart';
import 'package:fashion_wave/product/ui/product_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Wave',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LogInScreen(),
        '/product': (context) => const ProductScreen(),
      },
    );
  }
}
