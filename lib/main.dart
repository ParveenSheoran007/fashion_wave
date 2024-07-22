import 'package:fashion_wave/auth/provider/auth_providr.dart';
import 'package:fashion_wave/auth/ui/login_screen.dart';
import 'package:fashion_wave/product/provider/product_provider.dart';
import 'package:fashion_wave/product/ui/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ProductScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}