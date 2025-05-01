import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart/presentation/screens/index.dart';
import 'package:cart/providers/cart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignIn(),
        '/home': (context) => const Home(),
        '/cart': (context) => const CartDetails(),
        '/product_details': (context) => const ProductDetails(),
      },
    );
  }
}
