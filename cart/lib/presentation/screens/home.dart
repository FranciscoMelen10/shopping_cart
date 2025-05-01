import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:cart/presentation/widgets/index.dart';
import 'package:cart/providers/cart_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          "Store",
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/Logo.svg',
                  height: 50,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('Perfil'),
              onTap: () {
                print("Perfil");
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text('Configuración'),
              onTap: () {
                print("Configuración");
              },
            ),
            ListTile(
              leading: const Icon(Icons.close, color: Colors.black),
              title: const Text('Salir'),
              onTap: () {
                Provider.of<CartProvider>(context, listen: false).removeCart();
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Products(),
    );
  }
}
