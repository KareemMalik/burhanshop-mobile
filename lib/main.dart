import 'package:flutter/material.dart';
import 'screens/menu.dart';
import 'screens/productlist_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0E4DA4),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/add-product': (context) => const ProductFormPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
